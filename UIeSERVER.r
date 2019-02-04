########################
###   Shiny App      ###
########################
install.packages('rsconnect')
library(rsconnect)
library(shiny)
library(dplyr)
library(plotly)
library(leaflet)
source("sim_lib.r")
library(readxl)
library(shinythemes)
library(htmltools)
ristoranti <- read_excel("DoveAndiamoAMangiare.xlsx")
str(ristoranti)
ristoranti$Prezzo<-as.numeric(ristoranti$Prezzo)
ristoranti$Votofinale<-as.numeric(ristoranti$Votofinale)
ristoranti$Cucina<-as.numeric(ristoranti$Cucina)
ristoranti$Servizio<-as.numeric(ristoranti$Servizio)
ristoranti$Atmosfera<-as.numeric(ristoranti$Atmosfera)
ristoranti$servizi<-as.factor(ristoranti$servizi)
ristoranti$EsigenzeAlimentari<-as.factor(ristoranti$EsigenzeAlimentari)
ristoranti$TipoCucina<-as.factor(ristoranti$TipoCucina)
ristoranti$TipoCucina1<-as.factor(ristoranti$TipoCucina1)
ristoranti$Quartiere<-as.factor(ristoranti$Quartiere)
ristoranti$Latitudine<-as.numeric(ristoranti$Latitudine)
ristoranti$Longitudine<-as.numeric(ristoranti$Longitudine)
ristoranti$Indice<-as.numeric(ristoranti$Indice )
ristoranti$Sentiment<-as.numeric(ristoranti$Sentiment )
ristoranti$Nome<-as.factor(ristoranti$Nome )


## UI

ui<-fluidPage( 
  
  theme=shinytheme("darkly"),
  
  titlePanel("Dove andiamo a mangiare?"),
  
  sidebarLayout(      
    
    sidebarPanel(
      selectInput("cucina", "Seleziona il tipo di cucina", 
                  choices=c("Qualsiasi",levels(ristoranti$TipoCucina)),selected="Qualsiasi"),
      uiOutput("vx"),
      hr(),
      sliderInput("prezzo", "Fascia di prezzo",
                  min = min(ristoranti$Prezzo), max = max(ristoranti$Prezzo),
                  value = c(8,135)),
      hr(),
      helpText(strong('Servizi')),
      checkboxInput("animali", "Animali ammessi", FALSE),
      checkboxInput("disabili", "Accesso disabili", FALSE),
      hr(),
      helpText(strong('Esigenze alimentari')),
      checkboxInput("vegetariano","Vegetariano",F),
      checkboxInput("bio","Biologico",F),
      checkboxInput("vegano","Vegano",F),
      checkboxInput("glutine","Senza glutine",F)
      
    ),
    
    mainPanel(
      tabsetPanel(type = "tabs", 
                  tabPanel("Grafico e Graduatoria",
                           br(),
                           fluidRow(plotlyOutput("EatPlot",height = 450,width = 750)),
                           br(),fluidRow(width=8,h4(strong(textOutput('github')))),
                           br(), fluidRow(tableOutput("table1"))),
                                           
                  tabPanel("Mappa", br(),leafletOutput("mymap",height = 450,width = 600), br(), tableOutput("table")),
                  tabPanel("Confronto",
                           br(),
                           column(5,uiOutput("ok"),uiOutput("t"),uiOutput("link")),
                           column(5,uiOutput("ok1"),uiOutput("t1"),uiOutput("link1"))
                           )
                           
      )

      )
    ) 
  
)

## SERVER

server<-function(input, output) {
  
  output$ok<- renderUI({
    intersezione<<-selezione(ristoranti,input$prezzo,input$cucina,input$cucina1,input$animali,input$disabili,input$vegetariano,input$bio,input$vegano,input$glutine)
    ristoranti1=ristoranti[intersezione,]
    ordine<-sort(ristoranti1$Indice, decreasing=T )
    us<-vector()
    for (i in 1:nrow(ristoranti1)) {
      us[i]<-which(ristoranti1$Indice==ordine[i])
      
    }
    selectInput("risto","Scegli un ristorante", choices =ristoranti1[us,"Nome"] )
  
    })
  output$ok1<- renderUI({
    intersezione<<-selezione(ristoranti,input$prezzo,input$cucina,input$cucina1,input$animali,input$disabili,input$vegetariano,input$bio,input$vegano,input$glutine)
    ristoranti1=ristoranti[intersezione,]
    ordine<-sort(ristoranti1$Indice, decreasing=T )
    us<-vector()
    for (i in 1:nrow(ristoranti1)) {
      us[i]<-which(ristoranti1$Indice==ordine[i])
      
    }
    selectInput("risto1","Scegli un ristorante", choices =c("",ristoranti1[us,"Nome"]) )
    
  })
  
  output$t<-renderTable({
   l=c("Nome","Prezzo Medio","Numero Recensioni","Cucina","Servizio","Atmosfera" ,"Qualita'-Prezzo","Rumorosita'","Tempo Attesa","Sentiment Analysis","Tasty Index")  
   tabella=data.frame(ciao=l,dario=rbind(t(ristoranti[ristoranti$Nome==input$risto,c("Nome","Prezzo","Recensioni","Cucina10","Servizio10","Atmosfera10","QualitaPrezzo1","Rumorosita1","TempoAttesa1")]),
                                         round(t(ristoranti[ristoranti$Nome==input$risto,c("Sentiment","Indice")]),3)))
   colnames(tabella)=c("","  ")
   tabella
  })
  
  output$t1<-renderTable({
    if(input$risto1=="") return()
    else{
    l=c("Nome","Prezzo Medio","Numero Recensioni","Cucina","Servizio","Atmosfera" ,"Qualita'-Prezzo","Rumorosita'","Tempo Attesa","Sentiment Analysis","Tasty Index")  
    tabella=data.frame(ciao=l,dario=rbind(t(ristoranti[ristoranti$Nome==input$risto1,c("Nome","Prezzo","Recensioni","Cucina10","Servizio10","Atmosfera10","QualitaPrezzo1","Rumorosita1","TempoAttesa1")]),
                                          round(t(ristoranti[ristoranti$Nome==input$risto1,c("Sentiment","Indice")]),3)))
    colnames(tabella)=c("","  ")
    tabella
    }
  })


  var<-reactive({
    f<-levels(ristoranti$TipoCucina) 
    switch(input$cucina,
           "Africana"=c("Qualsiasi","Eritreo", "Etiope","Libanese"),
           "Orientale"=c("Qualsiasi","Cinese","Coreano", "Fusion", "Giapponese", "Indiano", "Thailandese"),
           "Europea"=c("Qualsiasi","Francese","Greco","Scandinavo","Spagnolo"),
           "Sudamericana"=c("Qualsiasi","Argentino","Brasiliano","Messicano", "Peruviano"),
           "Regionale"=c("Qualsiasi","Abruzzese","Campano","Emiliano","Ligure","Lombardo","Pugliese","Romano","Siciliano","Toscano"))
  })
  
  
  output$vx<-renderUI({
    selectInput("cucina1","Ulteriori opzioni",choices = var())
  })
  
  
  output$EatPlot <- renderPlotly({
    intersezione<<-selezione(ristoranti,input$prezzo,input$cucina,input$cucina1,input$animali,input$disabili,input$vegetariano,input$bio,input$vegano,input$glutine)
    ristoranti1=ristoranti[intersezione,]
    f1<-list(family="Courier New",size=17,color="white")
    f2 <- list(family = "Courier New",size = 13,color = "white")
    leg=list(font=list(family="Courier New",color="white",size=13))
    a<- list(title="The Fork Evaluation",titlefont=f1,linecolor="white",tickcolor="white",linewidth=2,gridcolor=gray.colors(n=1,start=0.15),tickfont=f2)
    b<- list(title="Tasty Index",titlefont=f1,tickcolor="white",linecolor="white",linewidth=2,gridcolor=gray.colors(n=1,start=0.15),tickfont=f2)
    plot_ly(ristoranti1,x=ristoranti1$Votofinale,y=ristoranti1$Indice,text=ristoranti1$Nome,mode="markers",
            type="scatter",color=ristoranti1$Quartiere,colors=c("red","darkorange","yellow1", "green", "darkgreen","cyan","blue2", "magenta2","pink", "white")  
            
                                                                ,size=ristoranti1$Prezzo
            , symbol=ristoranti1$Quartiere,symbols=rep("octagon",10) 
            ) %>% layout(xaxis=a,yaxis=b,plot_bgcolor=gray.colors(n=1,start=0.135),paper_bgcolor=gray.colors(n=1,start=0.135),
                         legend=leg)
  }
  )
  
  output$mymap=renderLeaflet({
    
    intersezione<<-selezione(ristoranti,input$prezzo,input$cucina,input$cucina1,input$animali,input$disabili,input$vegetariano,input$bio,input$vegano,input$glutine)
    ristoranti1=ristoranti[intersezione,]
    
    leaflet() %>%
      addTiles() %>%
      setView(lat=45.4801188,lng=9.187965299999973, zoom=12) %>%
           addMarkers(lng=ristoranti1$Longitudine, lat=ristoranti1$Latitudine, label=ristoranti1$Nome) 
  
    
    
    })
 names(ristoranti) 
  output$table <- renderTable({ 
    intersezione<<-selezione(ristoranti,input$prezzo,input$cucina,input$cucina1,input$animali,input$disabili,input$vegetariano,input$bio,input$vegano,input$glutine)
    ristoranti1=ristoranti[intersezione,]
    ordine<-sort(ristoranti1$Indice, decreasing=T )
    us<-vector()
    for (i in 1:nrow(ristoranti1)) {
      us[i]<-which(ristoranti1$Indice==ordine[i])
      
    }
    ristoranti1[us,c("Nome","Quartiere","Indirizzo")]
  })
  
  output$table1 <- renderTable({
    intersezione<<-selezione(ristoranti,input$prezzo,input$cucina,input$cucina1,input$animali,input$disabili,input$vegetariano,input$bio,input$vegano,input$glutine)
    ristoranti1=ristoranti[intersezione,]
    ordine<-sort(ristoranti1$Indice, decreasing=T )
    us<-vector()
    for (i in 1:nrow(ristoranti1)) {
      us[i]<-which(ristoranti1$Indice==ordine[i])
      
    }
    ris=ristoranti1[us,c("Nome","Indice")]
    colnames(ris)=c("Nome","Tasty Index")
    ris
  })

   output$link <- renderUI({
     url <- a(ristoranti[ristoranti$Nome==input$risto,"Nome"], href=ristoranti[ristoranti$Nome==input$risto,"Sito"])
    tagList("Prenota su TheFork :",url)
  })
   output$link1 <- renderUI({
     if(input$risto1=="") return()
     else{
     url <- a(ristoranti[ristoranti$Nome==input$risto1,"Nome"], href=ristoranti[ristoranti$Nome==input$risto1,"Sito"])
     tagList("Prenota su TheFork :",url)
     }
   })
  
  output$github <- renderText({
    intersezione<<-selezione(ristoranti,input$prezzo,input$cucina,input$cucina1,input$animali,input$disabili,input$vegetariano,input$bio,input$vegano,input$glutine)
    ristoranti1=ristoranti[intersezione,]
   paste0('La ricerca ha prodotto ',nrow(ristoranti1),' risultati.')
  })  
  
  
}


shinyApp(ui, server)

