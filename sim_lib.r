#########################################
### Funzione per selezionare i ristoranti
#########################################

selezione=function(ristoranti,prezzo,cucina,cucina1,animali,disabili,vegetariano,bio,vegano,glutine){
p<-as.integer(prezzo) 
pInf<-p[1]
pSup<-p[2]
P<-which(ristoranti$Prezzo>=pInf & ristoranti$Prezzo<=pSup)


if(cucina=="Qualsiasi") cuc<-1:nrow(ristoranti) else cuc<-which(ristoranti$TipoCucina==cucina)
if(cucina=="Africana") ifelse(cucina1=="Qualsiasi",cuc<-which(ristoranti$TipoCucina==cucina),cuc<-which(ristoranti$TipoCucina1==cucina1) )
if(cucina=="Orientale") ifelse(cucina1=="Qualsiasi",cuc<-which(ristoranti$TipoCucina==cucina),cuc<-which(ristoranti$TipoCucina1==cucina1) )
if(cucina=="Europea") ifelse(cucina1=="Qualsiasi",cuc<-which(ristoranti$TipoCucina==cucina),cuc<-which(ristoranti$TipoCucina1==cucina1) )
if(cucina=="Sudamericana") ifelse(cucina1=="Qualsiasi",cuc<-which(ristoranti$TipoCucina==cucina),cuc<-which(ristoranti$TipoCucina1==cucina1) )
if(cucina=="Regionale") ifelse(cucina1=="Qualsiasi",cuc<-which(ristoranti$TipoCucina==cucina),cuc<-which(ristoranti$TipoCucina1==cucina1) )



if (animali|disabili){
  if(animali) un=which(ristoranti$servizi=="animali"|ristoranti$servizi=="animali e disabili") 
  if(disabili) un=which(ristoranti$servizi=="disabili"|ristoranti$servizi=="animali e disabili")
  if(animali&disabili) un<-which(ristoranti$servizi=="animali e disabili")
}
else un=1:nrow(ristoranti)


if(vegetariano|bio|glutine|vegano){
  
  #1 PULSANTE
  if(vegetariano) es<-which(ristoranti$EsigenzeAlimentari=="piatti vegetariani"|
                                    ristoranti$EsigenzeAlimentari=="piatti vegetariani/piatti biologici"|
                                    ristoranti$EsigenzeAlimentari=="piatti vegetariani/piatti vegani"|
                                    ristoranti$EsigenzeAlimentari=="piatti vegetariani/piatti vegani/piatti biologici"|
                                    ristoranti$EsigenzeAlimentari=="piatti vegetariani/senza glutine/piatti biologici/piatti vegani"|
                                    ristoranti$EsigenzeAlimentari=="piatti vegetariani/senza glutine"|
                                    ristoranti$EsigenzeAlimentari=="piatti vegetariani/senza glutine/piatti biologici"|
                                    ristoranti$EsigenzeAlimentari=="piatti vegetariani/senza glutine/piatti vegani")
  
  
  if(vegano) es<-which(ristoranti$EsigenzeAlimentari=="piatti vegani"|
                               ristoranti$EsigenzeAlimentari=="piatti vegetariani/piatti vegani"|
                               ristoranti$EsigenzeAlimentari=="piatti vegetariani/piatti vegani/piatti biologici"|
                               ristoranti$EsigenzeAlimentari=="piatti vegetariani/senza glutine/piatti biologici/piatti vegani"|
                               ristoranti$EsigenzeAlimentari=="piatti vegetariani/senza glutine/piatti vegani")
  
  if(bio) es<-which(ristoranti$EsigenzeAlimentari=="piatti biologici"|
                            ristoranti$EsigenzeAlimentari=="piatti vegetariani/piatti biologici"|
                            ristoranti$EsigenzeAlimentari=="piatti vegetariani/piatti vegani/piatti biologici"|
                            ristoranti$EsigenzeAlimentari=="piatti vegetariani/senza glutine/piatti biologici"|
                            ristoranti$EsigenzeAlimentari=="piatti vegetariani/senza glutine/piatti biologici/piatti vegani")
  
  if(glutine) es<-which(ristoranti$EsigenzeAlimentari=="senza glutine"|
                                ristoranti$EsigenzeAlimentari=="piatti vegetariani/senza glutine/piatti vegani"|
                                ristoranti$EsigenzeAlimentari=="piatti vegetariani/senza glutine/piatti biologici/piatti vegani"|
                                ristoranti$EsigenzeAlimentari=="piatti vegetariani/senza glutine/piatti biologici"|
                                ristoranti$EsigenzeAlimentari=="piatti vegetariani/senza glutine")
  
  #4 PULSANTI
  if(vegetariano& glutine&vegano &bio) es<-which(ristoranti$EsigenzeAlimentari=="piatti vegetariani/senza glutine/piatti biologici/piatti vegani")
  
  
  #2 PULSANTI
  #Vegetariani con alti
  if(vegetariano & glutine) es<-which(ristoranti$EsigenzeAlimentari=="piatti vegetariani/senza glutine"|
                                                    ristoranti$EsigenzeAlimentari=="piatti vegetariani/senza glutine/piatti biologici"|
                                                    ristoranti$EsigenzeAlimentari=="piatti vegetariani/senza glutine/piatti biologici/piatti vegani"|
                                                    ristoranti$EsigenzeAlimentari=="piatti vegetariani/senza glutine/piatti vegani")
  if(vegetariano & vegano)  es<-which(ristoranti$EsigenzeAlimentari=="piatti vegetariani/piatti vegani"|
                                                    ristoranti$EsigenzeAlimentari=="piatti vegetariani/piatti vegani/piatti biologici"|
                                                    ristoranti$EsigenzeAlimentari=="piatti vegetariani/senza glutine/piatti biologici/piatti vegani"|
                                                    ristoranti$EsigenzeAlimentari=="piatti vegetariani/senza glutine/piatti vegani")
  
  if(vegetariano & bio)  es<-which(ristoranti$EsigenzeAlimentari=="piatti vegetariani/piatti biologici"|
                                                 ristoranti$EsigenzeAlimentari=="piatti vegetariani/piatti vegani/piatti biologici"|
                                                 ristoranti$EsigenzeAlimentari=="piatti vegetariani/senza glutine/piatti biologici/piatti vegani"|
                                                 ristoranti$EsigenzeAlimentari=="piatti vegetariani/senza glutine/piatti biologici")
  #vegani con altri
  if(vegano & bio)  es<-which(ristoranti$EsigenzeAlimentari=="piatti vegetariani/senza glutine/piatti biologici/piatti vegani"|
                                            ristoranti$EsigenzeAlimentari=="piatti vegetariani/piatti vegani/piatti biologici")
  
  if(vegano & glutine)  es<-which(ristoranti$EsigenzeAlimentari=="piatti vegetariani/senza glutine/piatti biologici/piatti vegani"|
                                                ristoranti$EsigenzeAlimentari=="piatti vegetariani/senza glutine/piatti vegani")
  
  #biologici con altri
  if(bio & glutine)  es<-which(ristoranti$EsigenzeAlimentari=="piatti vegetariani/senza glutine/piatti biologici/piatti vegani"|
                                             ristoranti$EsigenzeAlimentari=="piatti vegetariani/senza glutine/piatti biologici")
  
  
  #3 PULSANTI
  if(vegetariano & glutine & bio) es<-which(ristoranti$EsigenzeAlimentari=="piatti vegetariani/senza glutine/piatti biologici/piatti vegani"|
                                                                ristoranti$EsigenzeAlimentari=="piatti vegetariani/senza glutine/piatti biologici")
  
  if(vegetariano & vegano & bio) es<-which(ristoranti$EsigenzeAlimentari=="piatti vegetariani/senza glutine/piatti biologici/piatti vegani"|
                                                               ristoranti$EsigenzeAlimentari=="piatti vegetariani/piatti vegani/piatti biologici")
  
  if(vegetariano & glutine & vegano) es<-which(ristoranti$EsigenzeAlimentari=="piatti vegetariani/senza glutine/piatti biologici/piatti vegani"|
                                                                   ristoranti$EsigenzeAlimentari=="piatti vegetariani/senza glutine/piatti vegani")
  
  if(vegano & glutine & bio) es<-which(ristoranti$EsigenzeAlimentari=="piatti vegetariani/senza glutine/piatti biologici/piatti vegani")
  
  
  
}
else es=1:nrow(ristoranti)

i1<-intersect(P,cuc)
i2<-intersect(i1,es)
intersezione<-intersect(i2,un)
intersezione
}
