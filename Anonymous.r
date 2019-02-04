library(sentimentr)

text<-readLines("C://Users//casam//Desktop//Progetto Ristoranti Finito.txt")


###########################################################################
#PUNTEGGIO(Ottenuto da recensioni)
###########################################################################

#POLARITY
parolebelle=c("ottimo","ottima","ottimi","ottime","ottim","qualita","qualit","buono","buona","buoni","buone","buon","bene"
              ,"ben","bonta","bont","buonissimo","buonissima","buonissimi","buonissime","gentile","gentili","gentilezza",
              "gentilissimo","gentilissima","gentilissimi","gentilissime",
              "impeccabile","impeccabili","scoperta","scoperte","elegante","eleganti","elegant","elegantissimo","elegantissima",
              "grazie","merito","elegantissimi","elegantissime","consigliatissimi","consigliatissime",
              "tornero","torniamo","torneremo","tornera","torneranno","torno","torna","tornato","tornata","tornati","tornate","tornarci","scontato","scontata","scontati","scontate",
              "consiglio","consigliamo","consiglia","consigliatissimo","consigliatissima","accogliente","accoglienti",
              "accoglientissimo","accoglientissimi","accoglientissima","accoglientissime","bello","bella","bel",
              "belli","belle","bellissimo","bellissima","bellissimi","bellissime","disponibile",
              "disponibili","disponibilita","disponibil","disponibilissimo","disponibilissima","disponibilissimi","disponibilissime"
              ,"perfetto","perfetta","perfetti","perfette","perfettamente","accoglientissimo","accoglientissima","accoglientissimi","accoglientissime",
              "perfezione","accogliente","accoglienti","raffinato","raffinata","raffinati","raffinate","raffinatezza",
              "raffinatissimo","raffinatissima","raffinitissimi","raffinitissime",
              "eccellente","eccellenti","eccellenza","eccellentissimo","eccellentissima","eccellentissimi","eccellentissime",
              "efficienza","efficiente","efficienti","efficientissimo","efficientissima","efficientissimi"
              ,"cordiale","cordiali","cordialita","efficientissime","cordialissimo","cordialissima","cordialissimi","cordialissime",
              "professionale","professionali","professionalita","professional","professionalissimo","professionalissima","professionalissimi","professionalissime",
              "altezza","all'altezza","allaltezza","super","top","centrale","centrali","centralita","centralissimo","centralissima","centralissimi","centralissime",
              "onesto","onesta","onesti","oneste","onestissimo","onestissima","onestissimi","onestissime",
              "interessante","interessanti","interessantissimo","interessantissima","interessantissimi","interessantissime","interesse",
              "delizia","delizie","delisioso","deliziosa","deliziosi","deliziose","apprezzo","apprezzato","apprezzati","apprezzate","apprezzata",
              "ascoltare","ascoltato","ascoltati","ascoltate","ascoltata","ascoltando","famoso","famosa","famosi",
              "famose","famosissimo","famosissima","famosissimi","famosissime","giusto",
              "giusta","giusti","giuste","giustissimo","giustissima","giustissimi","giustissime","giustezza",
              "magico","magica","magici","magiche","magia","positivo","positiva","positivi","positive","positivita",
              "ritorno","ritornero","ritorneranno","ritorneremo","ritornarci","sobrio","sobria","sobri","sobrie","sobrieta",
              "suggestivo","suggestiva","suggestivi","suggestive","spettacolare","spettacolari","cura",
              "curato","curata","curati","curate","curatissimo","curatissima","curatissimi","curatissime",
              "dettagliato","dettagliata","dettagliati","dettagliate","benissimo",
              "delicato","delicata","delicati","delicate","delicatezza","delicatissimo","delicatissima","delicatissimi","delicatissime",
              "sfizioso","sfiziosa","sfiziosi","sfiziose","sfiziosita","sfiziosissimo","sfiziosissima","sfiziosissimi","sfiziosissime",
              "grande","grandi","grandezza","grandissimo","grandissima","grandissimi","grandissime",
              "tranquillo","tranquilla","tranquilli","tranquille","tranquillita","tranquillissimo","tranquillissima","tranquillissimi","tranquillissime",
              "sorprendente","sorpresa","sorpresi","sorpreso","sorprese","sorprendenti","funzionale","funzionali","funzionalita",
              "originale","originali","originalita","originalissimo","originalissima","originalissimi","originalissime",
              "soddisfatto","soddisfatta","soddisfatti","soddisfatte","soddisfazione","soddisfacenti","soddisfacente",
              "corretto","corretta","corretti","corrette","correttezza","correttissimo","correttissima","correttissimi","correttissime",
              "gradito","gradita","graditi","gradite","gradimento","gradimenti","graditissimo","graditissima","graditissimi","graditissime",
              "piacere","piaceri","piacevole","piacevoli","piacevolissimo","piacevolissima","piacevolissimi","piacevolissime","piacevolmente",
              "conveniente","convenienti","convenienza","convenientissimo","convenientissima","convenientissimi","convenientissime",
              "ricercato","ricercata","ricercati","ricercate","ricercatissimo","ricercatissima","ricercatissimi","ricercatissime",
              "speciale","speciali","sublime","sublimi","creativo","creativa","creativi","creative","creativita",
              "complimenti","complimentare", "favola","favole", "favoloso","favolosa","favolosi","favolose",
              "squisito","squisiti","squisita","squisite","squisitissimo","squisitissima","squsitissimi","squisitissime","squisitezza","squisitezze",
              "confortevole","confortevoli","confortevolissimo","confortevolissima","confortevolissimi","confortevolissime","comfort",
              "merito","merita","meritano","meritato","strameritato","stra meritato","meritevole","meritati","meritate","meritevoli",
              "vasto","vasta","vasti","vaste","vastissimo","vastissima","vastissimi","vastissime","vastita",
              "eccezionale","eccezionali","rapido","rapida","rapidi","rapide","rapidissimo","rapidissima","rapidissimi","rapidissime","rapidita",
              "stupito","stupita","stipiti","stupite","stupire",
              "meraviglioso","meravigliosa","meravigliosi","meravigliose","meraviglia","meraviglie",
              "esatto","esatti","esatta","esatte","esattissimo","esattissima","esattissimi","esattissime",
              "goduto","goduta","goduti","godute","godere","goduria","godevole",
              "ampio","ampia","ampi","ampie","ampiezza","ampissimo","ampissima","ampissimi","ampissime",
              "sveglio","sveglia","svegli","sveglie","puntuale","puntuali","puntialissimo","puntualissima","puntualissimi","puntualissime","puntualita",
              "bravo","brava","bravi","brave","bravura","bravissimo","bravissima","bravissimi","bravissime",
              "magnifico","magnifica","magnifici","magnifiche", "esemplari","esemplare", "egregio","egregi","egregia","egregie",
              "ideale","ideali","di cuore","serio","seria","seri","serie","serissimo","serissima","serissimi","serissime","serieta",
              "perbene","amabile","amabili","amabilissimo","amabilissima","amabilissimi","amabilissime",
              "affabilissimo","affabilissima","affabilissimi","affabilissime","affabile","affabili", 
              "cortese","cortesi","cortesissimo","cortesissima","cortesissimi","cortesissime","cortesia",
              "paziente","pazienti","pazientissimo","pazientissima","pazientissimi","pazientissime",
              "amorevole","amorevoli","affettuoso","affettuosa","affettuosi","affettuose","benevolo","benevola","benevoli","benevole",
              "comprensivo","comprensiva","comprensivi","comprensive","comprensione",
              "tollerante","tolleranti","tolleranza","indulgente","indulgenti","indulgenza",
              "clemente","clementi","clemenza", "umano","umani","umana","umane",
              "sensibile","sensibili","sensibilita","sensibilissimo","sensibilissima","sensibilissimi","sensibilissime",
              "altruista","altruisti","altruiste","altruismo","generoso","generosa","generosi","generose","generosita",
              "generosissimo","generosissima","generosissime","generosissimi",
              "disciplinato","disciplinata","disciplinati","disciplinate","disciplina","diligenti","diligente","diligenza",
              "rispettoso","rispettosa","rispettosi","rispettose","sereno","serena","sereni","serene",
              "serenissimo","serenissima","serenissimi","serenissime","serenita","abile","abili",
              "abilissimo","abilissimi","abilissima","abilissime","abilita","capace","capaci","capacita",
              "capacissimo","capacissima","capacissimi","capacissime","affidabile","affidabili","affidabilita","affidabilissimo",
              "affidabilissima","affidabilissimi","affidabilissime","adatto","adatta","adatti","adatte",
              "adattissimo","adattissima","adattissimi","adattissime","idoneo","idonea","idonei","idonee","idoneita",
              "esperto","esperta","esperti","esperte","espertissimo","espertissima","espertissimi"
              ,"espertissime", "competente","competenti","competenza","competentissimo","competentissima","competentissimi","competentissime",
              "efficace","efficaci","efficacissimo","efficacissima","efficacissimi","efficacissime","efficacia","opportuno","opportuna","opportuni","opportune",
              "appropriato","appropriata","appropriati","appropriate", "sicuro","sicura","sicuri","sicure","sicurissimo","sicurissima","sicurissimi","sicurissime","sicurezza",
              "da provare","attento","attenta","attenti","attente","attenzione","attentissimo","attentissima","attentissimi","attentissime","consigliato","consigliata",
              "consiglio","consigliare","consigliatissimo","consigliatissima","consigliatissimi","consigliatissime","carino","carina","carini","carine",
              "carinissimo","carinissima","carinissimi","carinissime","delizioso","deliziosa","deliziosi","deliziose","delizia",
              "fantastico","fantastica","fantastici","fantastiche","particolare","particolari","particolarita","abbondante","abbondanti","abbondanza",
              "conferma","vario","garantito","garantita","garantiti","garantite","garanzia","familiare","familiari",
              "migliore","migliori","il meglio","fresco","fresca","freschi","fresche","freschezza","freschissimo","freschissima","freschissimi","freschissime",
              "piacere","piaciuto","piaciuta","piaciuti","piaciute","rilassato","rilassata","rilassati","rilassate","rilassante","rilassanti","relax","amante","amanti",
              "amichevole","amichevoli","gustoso","gustosa","gustosi","gustose","gustosissimo","gustosissima","gustosissimi","gustosissime",
              "incredibile","incredibili","intimo","intima","intimi","intime","eccelso","eccelsa","eccelsi","eccelse",
              "preciso","precisa","precisi","precise","precisione","precisissimo","precisissima","precisissimi","precisissime",
              "simpatico","simpatica","simpatici","simpatiche","simpaticissimo","simpaticissima","simpaticissimi","simpaticissime","simpatia",
              "veloce","veloci","velocissimo","velocissima","velocissimi","velocissime","adeguato","adeguata","adeguati","adeguate","adeguatezza",
              "gradevole","gradevoli","originalita","saporito","saporita","saporiti","saporite","saporitissimo","saporitissima","saporitissimi","saporitissime",
              "accattivante","accantivanti","accessibile","accessibili","accessibilissimo","accessibilissimi","accessibilissima","accessibilissime",
              "adeguato","adeguata","adeguati","adeguate","adeguatezza","affabile","affabili","allegria","allegro","allegra","allegri","allegre",
              "approvato","approvata","approvati","approvate","approvatissimo","approvatissima","approvatissimi","approvatissime",
              "autentico","autentici","autentiche","benvenuto","certezza","certezze","comodo","comoda","comodi","comode",
              "comodissimo","comodissima","comodissimi","comodissime", "contento","contenta","contenti","contente","contentissimo","contentissima","contentissimi","contentissime",
              "cool","croccante","croccanti","croccantissimo","croccantissima","croccantissimi","croccantissime",
              "deliziosamente","divinamente","divino","divina","divini","divine","economico","economica",
              "entusiasta","entusiasti","felicemente","felice","felici","felicissimo","felicissima","felicissimi","felicissime",
              "galante","galanti","garbato","garbata","garbati","garbate","grandioso","grandiosa","grandiosi","grandiose",
              "gratis","grazioso","graziosa","graziosi","graziose","graziosissimo","graziosissima","graziosissimi","graziosissime",
              "incantevole","incantevoli","innovativo","innovativa","innovativi","innovative","innovazione",
              "invitante","invitanti","irrinunciabile","irrinunciabili","leggero","leggera","leggeri","leggere","leggerissimo","leggerissima","leggerissimi","leggerissime",
              "morbido","morbida","morbidi","morbide","morbidissimo","morbidissima","morbidissimi","morbidissime",
              "ospitale","ospitali","ospitalita","preferito","preferita","preferiti","preferite","prelibatezza","prelibatezze",
              "prelibato","prelibata","prelibati","prelibati","prelibatissimo","prelibatissima","prelibatissimi","prelibatissime",
              "sorridente","sorridenti","sorriso","stellare","stellari","stile","straconsigliato","stragentile","stragentili","straordinario","straordinaria","straordinari","straordinarie","straordinariamente",
              "supergentile","supergentili","superlativo","superlativa","superlativi","superlative",
              "volentieri","minimo dettaglio","granche","da provare","consigliato","consigliata","consigliati","consigliate","consigliatissimo","consigliatissima","consigliatissimi","consigliatissime",
              "chicca","grazioso","graziosa","graziosi","graziose","stupefacente",
              "sofisticata","intriganti","notevoli","azzeccatissimi", "egregiamente",
              "sensazionale","premurosi","compiaciuta","empatico","fragrante","mitico","ripeterei",
              "impagabile","coerente","genuino","tenerezza","riuscitissima","sorprenderci","accurate","superveloce", 
              "azzeccata","consiglieremo","meravigliosamente","profumatissimo","digeribilissima","stupendi","tenerissima",
              "intramontabili","mozzafiato","superfornito","armonia","armonioso","capolavoro",                
              "inimitabili","sbalorditiva","impressionanante","ricchissimo","ritorenerei","consigliarlo",     
              "vincente","pulitissima","succulente","divertenti" ,"fenomenale","fantasmagorica","ottimali",
              "applausi","intramontabile","provare","ragionevoli","appassionati","memorabile","tornare","ritornero",
              "ritornare","ripetere","riprovare","notevole","educato","cordialita","rifare","consiglierei",
              "entusiasmante","bellezza","disponibilita","divertente","equilibrati","spazioso","conviviale",
              "organizzato","pulito","tornerei","premuroso","granche","gioia","splendida","stupendo", "preparatissimo",
              "strepitoso", "miglior","variegato","correttamente","sorrisi","splendido","entusiasmato","soffice",                  
              "affascinante","maggior", "indimenticabile","ritornerei","accurato", "strepitosa",  "abbondantissime", "calmo",  
              "azzeccati", "educati", "promosso","stupenda", "promossa", "tenerissimo", "azzeccato","geniale", "imperdibile",
              "caloroso","raccomandatissimo", "esaltante", "puliti", "nice", "strepitosi", "soddisfano")

polaritabelle=rep(1,length(parolebelle))

paroleneutre<-c("sevizio","piatti","piatto","personale","locale","cucina","cibo","ristorante","prezzo","prezzi","tutto",
                "atmosfera","posto","scoperto","scoperti","pesce","pizza","ambiente","ambienti","cena",
                "cene","cenetta","cenone","carne","menu","sconto","sconti","scontistica","rapporto","rapporti","stato","location",
                "lochescion","milano","scelta","scelti","scelto","scelte","euro","euri","volta","dolci","dolce","serata",
                "serate","seratone","seratona","seratina","porzioni","porzione","pranzo","pranzetto","pranzetti",
                "zona","vino","vini","amici","amico","amica","conto","media","tavolo","tavoli","esperienza",
                "ingrediente","ingredienti","casa","paticolare","antipasti","recensione","recensioni",
                "fatto","fatti","milanese","milanesi","tavoli","sushi","risotto","livello","hamburger","camerieri","cameriere",
                "carta","sala","sale","dolce","secondo","fase","accoglienza","proprietario","materie",
                "pasta","resto","primo","primi","centro","sapori","sapore","tempo","prodotto","prodotti","noi",
                "portata","portate","tartare","staff","staf","chef","pizze","pizza","cosa","tradizione","cose","attesa","attese",
                "pietanza","pietanze","prenotazione","vista","gusto","formale","informale","formali","informali",
                "brera","tempi","tempo","all","cliente","clienti","clientela","modo","modi","complimento","musica",
                "tartufo","anni","anno","cinese","cinesi","thefork","the fork","caffe","linea","cotoletta","pane","aspettative",
                "aspettativa","you","can","eat","proposte","proposta","sapore","sapori","pausa","pause","pena","persona",
                "persone","fine","birre","birra","mare","presentazione","titolare","varieta","verdure","tagliere","momento",
                "patate","caso","casi","porta","spaghetti","tonno","compagnia","latmosfera","giorno","lavoro","posizione",
                "detto","cameriera","brunch","qualcosa","coperto","cibi","tagliata","mano","riso","gamberi","stazione","materia","filetto",
                "arredato","contesto","minuti","calice","sabato","trattoria","famiglia","panini","aperitivo","formaggi","dessert","bottiglia","cottura","ambiente",
                "costo","selezione","acqua","ragazzi","pepe","salsa","lambiente","ragazza","patatine","mozzarella","sottofondo",
                "posti","luogo","speso","abbinamenti","tipo","lode","testa","persona","dettagli","grigliata","contorno","polpette","ayce",
                "manzo","ragazzo","coppia","pasto","zucca","spazio","angolo","pollo","piano","bambini","bufala","richieste","lista","proposta","cocktail","tiramisu",
                "circa","cose","neo","pizzeria","funghi","gnocchi","luci","proprietaria","vicini","buffet","parcheggio","portata","compleanno","idea","arredamento",
                "promozione","misto","gestione","differenza","gnocco","posticino","infamia","cassa","focaccia","cinesi","crema","teatro","ristorantino",
                "generale","cioccolato","proposti","generi","frutti","ossobuco","cacio","moderno","parmigiana","voglia","tapas","gestore","superiore","taglieri","bar","sugo",
                "vongole","davanti","aspetto","pretese","citta","aperto","torta","terza","calici","paccheri","panino","cannolo","preparazione","cantina","polpo","domenica","branzino",
                "glutine","trancio","sale","griglia","giudizio","causa","amiche","yums","degustazione","venezia","formaggio","varia","varieta","ostriche","realta","oggi",
                "lunica","gruppo","esempio","ora","impasto","prosecco","affettati","carni","bicchiere","consigli","bagno","fiori","nome",
                "uramaki","rosso","moglie","burrata","spiedini","allinterno","cera","amico","gente","occasione","thai","tagliolini","clima",
                "bevande","varianti","pomodoro","giardino","porcini","aria","paio","temperatura","hotel","carbonara","fritti","risotti","amica","punti","bistot","totale",
                "stagione","osteria","tocco","ricerca","pezzo","contenuti","natale","pistacchio","tagliatelle","melanzane","prenotare","accolto","lidea","data",
                "accostamenti","risultato","scelte","finale","contorni","cuoco","ricotta","signora","mese","italiano","spartano","meta","bottarga","tigelle","dente","tavola","condimento",
                "colleghi","localino","viaggio","pulizia","bocca","tavolini","specie","quartiere","fusion","insalata","involtini","ordinazioni", "lenta",
                "volume","dubbio","fonduta","maiale","mamma","cozze","olio","capesante","chips","salse","ripieno","polipo","tipologia","ragu","voto","mancia","anonimo",
                "linguine","soia","commenti","tavolata","duomo","clientela","polenta","passione","rustico","doc","bancone","dimensioni","menzione","carciofi","foto",
                "gourmet","spazi","sevizio","tratta","vegetariani","filetti","gelato","alternativa","chiacchierare","giorata","sashimi","panna","standard","turisti",
                "min","frittura","coreani","mezzo","caponata","burger","assaggi","spesa","giro","passaggio","recensione","cifra","errore","moda","arredi","mix","ore","bottiglie","spinaci","cambio","principale","soft",
                "mesi","roll","spada","castello","anno","saletta","responsabile","piazza","versione","etichette","zafferano","pagamento","bruschetta",
                "bbq","tappa","salsine","spiegazione","tortino","grigiate","inizio","completo","limone","paga","pomodorini","tovaglia","genuini",
                "storia","suggerimento","sedie","visita","cinghiale","gamberetti","bosco","ripieni","riferimento","valore","pesto","periodo","concept","griglia","soldi","mezzogiorno","pezzi","fassona",
                "frutta","zucchine","raccolta","bicchieri","stoviglie","vetro","gioco","conduzione","roma","fama","spettacolo","giovani","marito",
                "avocado","accompagnamento","burro","lattesa","arrivo","crosta","prenota","vita","letto","profumo","colori","enoteca","minuto",
                "strada","filo","valutazione","voti","salsiccia","brace","piedi","piadine","crudite","padrone","zuppa","struttura","doppio","aperture","apertura","aspettativa","profumi","equilibrio","doppie",
                "vegano","tantino","tovaglie","termine","zone","castagne","fascia","uovo","metro","forma","fermata","cavallo","ambientazione","giorni","retro","salame","traffico","chitarra","prodotto",
                "settimane","ritrovo","cime","compresa","scuse","trapanese","brodo","fiducia","igiene")

polaritaneutre=rep(0.001,length(paroleneutre))


parolebrutte=c( "delude","deludono","delusione","deluso","delusa","delusi","deluse","delusioni","deludente","peccato","male","fase di moderazione","moderazione","purtroppo","scadente","cari",  "caro","scarsa","scarso","scarsissime","scarsissima","scarsita","freddi","freddo","freddissime","freddissimo","freddino", "lentissimi",
                "pessimissimo","pessimo","pessima","pessimissime","pessimi","bassa","basso","bassi","bassissime","lento","lenti","lente","lentissime","lentissima","peggio","dimenticare","evitare","immangiabile","negativa","poco","poche","pochissima","pochi","pochissimi","sbagliato","sbagliata","sbagliati",
                "inesistente","spiace","spiaciuti","spiaciute","congelato","congelati","congelate","costoso","costosi","costose","costosissime","costosissimi","costosissimo","cruda","crudissima","dispiace","eccessiva","eccessivi","immangiabili","inaccettabile","inaccettabili","insufficiente","lentissimo", "malvagio","malvagia","malvagie",
                "pieno","riscaldato","riscaldata","riscaldate","sconsigliato","scortese","scortesi","secco","secche","secchi","secca","secchissimo","secchissimi","secchissime","secchissima","peggiori","peggiorato","avrebbero","buio","buie","bui","crudi","crudo","crude","crudissimo","crudissime","crudissimi","danno","disagio","disagiata","disagiate","disagiato","disorganizzato","disorganizzate","disorganizzati","disorganizzazione","eccessivo","eccessive","gelido","gelidi","gelida","indecente","indecenti","ingiustificate","ingiustificati","insignificante","insignificanti","insipida","insipide","maleducato","maleducata","maleducati","maleducazione","mancanza",
                "malissimo","malissime","malissimi","mediocre","mediocri","mediocrita","negativo","negative","negativi","nervosa","nervose","nervosi","nervosissimo","nervosissima","nervosissimi","nervosissime","pesanti","pesante","pesantissimo","pesantissime","sporco","sporche","sporchissime","sporchissimi","sporchissimo","sporchissima","riscaldarla","riscaldarle","riscaldarlo","rumoroso","rumorosi","rumorose","rumorosa","rumorosissimo","rumorosissimi","rumorosissime","rumorosissima","salatissimo","scadenti","scarsi","scomode","scomodi","scotti","scotte","sconsiglio","scomodo","sformato","sformati","sformate","sformata","sporchi","squallido","squallida","squallidi","trascurato","trascurati","trascurata","trascurate","vuoto",
                "vuoti","vuote","abbandonato","abbandonanti","abbandonavano","affollati","agognati","agognato","agognate","altalenante","altezzoso","altezzosi","altezzose","ammoniaca","anomalia","appesantito","appiccicati","arrogante","assente","assenti","assordante","assurdo","assurde","assurdi","avariati","banale","banali","basito","bizzarro","bizzarri","bizzarre","briciole","bruciacchiata","bruciate","bruciati","bruciato","brutto","brutta","brutte","brutti","bruttissima","bruttissime","bruttissimo","bruttissimi","cacofonia","cafonaggine","caos","caotica","catastrofico","cattivo","cattive","cattivi","chiassoso","appiccicoso","claustrofobica","confusionale","confuso","confuse","confusi","confusa","confusionali","cupo","cupi","cupe","debole","deboli","debola",
                "decliniamo","difetti","dimezzata","disappunto","disastro","disattento","disastroso","discriminatorio","discriminatoria","disordinato","disordinata","distratto","puzzolenti","puzzolente","puzzolenta", "scaduto","scaduta","scadute","tortuose","tortuosa","tortuosi","tortuoso","vuota",
                "dolori","esagerato","esauriti","esigue","esorbitanti","falda","falla","fatiscente","freddezza","gelava","gelavi","gelavamo","ghiacciaia","goffo","gommoso","gommosa","gommosi","gommose","imbarazzo","impreparato","impreparati","impreparate","improponibile","improponibili",
                "improvvisate","improvvisati","improvvisato","inammissibile","inammissibili","inappropriata","inappropriate","inappropriati","inappropriato","inclinato","storto","storte","storti","incubo","indigeribile","inesperti","ingiudicabile","inqualificabile","inquietante","insapore","insapori","insensata","insensate","insensato","insipidi","insipido","insolito","insolite","insonne","insopportabile","insopportabili","intollerante","intolleranza",
                "inutile","inutilmente","inverosimile","irriconoscibile","irriconoscibili","limitato","limitate","limitati","amaro","mancanti","mestamente","morte","morticia","mortisia","nauseante","nauseanti","nodoso","nodosa","odianti","offensivo","occupati", "avariate", "avariata",
                "orrido","orrori","orrore","orridi","orride","orribile","paradossale","pecca","peggiorati","peggiore","penalizza","penalizzati","penalizzato","penalizzate","perplessi","prevenuti", "raffermo","raffermi","rafferme","rafferma", "banalita", "inqualificabili",
                "poveri","povero","povere","povera","privo","privi","prive","problemi","problema","problematica","puzza","puzze","raffreddamento","raffreddamenti","agognata","ridotto","ridotte","rincaro","ridotti","ridotta","salato","salata","salati","salatissime","salatissimi",
                "sbaglio","scarno","scialbi","sciapo","sciapa","sciape","sciapi","scivolose","scivolosi","scivoloso","scivolosa","scocciato","scocciata","scocciati","scocciate","scondito","sconditi","scondite","sconsigliatissimo","scotto","scottona","spento","spenti","spente","spenta","sfigati",
                "sfigato","sfigata","sfavorevole","sfovorevoli","slegato","sollecito","solleciti","spacciati","spevantoso","spaventose","spaventosi","spiacevole","spiacevoli","sporca","sproporzionato","spina","spine","sproporzionati","sproporzionate","sproporzionata",
                "spropositati","spropositata","spropositate","spropositato","squallidamente","stangata","stopposo","stopposa","stopposi","stoppose","strusciando","stupidi","stupido","stupide","surgelato","surreale","surgelata","surgelati","surgelate","tappo", "indigeribili", "sudicio","sudice","sudicia","sudici",
                "terribili","tiepido","tiepidi","tiepide","tiepida","trasandato","trasandata","trasandate","trasandati","tristissimo","tristissima","tristissime","tristissimi","umiliarci","umiliante","umiliati","umiliato","umiliata","umilianti","umiliazione",
                "vergognoso","vergognosa","vergognose","vergognosi","vergogna","alto","alti", "zanzare","zanzara","schifo","schifezza","avariato","vecchio","vecchi","vecchia","vecchie","vecchissimo","vecchissima","vecchissime","vecchissimi","molle","molla","mollo","molli" ,"mollissimo","mollissima","mollissimi","mollissime",
                "rotto","rotta","rotti","rotte","distrutta","distrutte","distrutti","distrutto","sbeccato","sbeccati","sbeccata","sbeccate","triste", "inesperto","inesperta","mancante", "cacca","merda","vomito","spregevole","diarrea", "congelata",
                "ridicola","ridicolo","ridicoli","ridicole","mancati","mancato","mancata","mancate","sbrigativo","sbrigative","sbrigativi","sbrigativa", "afoso","afose","afosi","afosa","torrido","torride","torria","torridi","pazzo","pazzi","pazze","pazza","strampalato","strampalati","strampalate","strampalata",
                "amarissimi","invadenza","gelo","disidratata ","inadatta","ignoranti","maldestro",
                "risicata", "insofferente","interminabile","tristezza" ,"peggiorando", "peggiorata",                  
                "scortesia", "infernale",  "pesantezza","raffreddati", "malconcia ", "malridotta","rovinato",               
                "marasma","sfogo", "malessere","saccente", "unto", "ingiustificabili","lamentavano",                 
                "toppato","complicato","contaminazioni","incidente","acquose","freddissima",  "infastidita","migliorabili","migliorerei",
                "sbaglia","algido","bruciori","bruciore","lentezza","manca","colpa","sfortunatamente","pentimento",
                "migliorare", "norma", "fredda", "invadente", "migliorabile", "affollato", "lunghi", "rivedere", 
                "sacrificati","azzardati","invasivo" ,"lunghe" , "fredde","frettoloso","stonata","aggressivo", "fatica",  "distanti","critica",
                "asciutta","dispiaciuta","esagerati","incompleti","invisibili", "lamentela","nervoso",              
                "sacrificato","scontento","scorbutico","spifferi" , "incasinato","scarni" ,
                "errori"   ,  "gonfia"    ,    "insistente" ,  "pesantissima","mal" ,"irrisorio","lentino" , "inesperienza" ,"risicati"    ,          
                "denunciare" ,"perdere" ,  "medio"  ,  "limitata"  ,      "normale"  ,      
                "fretta","elevati","discreti","difficile","sufficiente","altini","inferiore","sovraffollato","lamentate","misero",
                "molliccia","urlare","asciutto","peggior","sufficienza","cattiva","approssimativo","sfortunata","sovrapprezzo", 
                "tragici","ingiustificatamente" ,"durissimo","frettolosa","sgarbo","strafottenti","piangere" ,"sbigottiti","appesantisce","carente",
                "impacciato","oneroso" ,"richiamo","ridicolmente" ,"impersonale","perplessita","infastidisce","disattenzioni","furibonda", 
                "frettolosamente","aggressivi","cafoni","intollerabile","ira","scottava","sgarbati","sgrida","sgridarci",        
                "superaffollati","errati"," pentito","difettosa","imbarazzante","infelice","rovinata","incompetenza","indifferente",
                "tremenda","fatiscenti","strano","beffa","malsana","inutili","ostentatezza","dolenti","scomodissime","misera","sollecitato","strapieno","strozzata",
                "ingombravano","stucchevole","modificherei","imperterriti","parolacce","provvedimento","schiammazzi","svogliata","disturbare","ridottissimo","irrisoria",
                "disguido","sfortunato","smarrita","sufficente","opprimente","affrettato","asettico","carenze","mancavano","chiassosa","sgradevole","distaccato","dimenticato",
                "scomodita","freschino" ,"confusione","difficolta","mancava","rumore","stretto","scarse","deludenti","confusionario","caotico","salate","scappare","esagerata",
                "inadeguato", "frenetica","troppo caro","troppo elevato","troppo cari","troppo elevati","odore","odori","fastidioso","acido","grasso",
                "affollata","stretti","fastidiosa","difetto","scomposto","bruciata","dolente" , "mah","terribile" ,"eccessivamente" , "dimenticati" , "fastidio" ,
                "difficolta" ,"nausea" )


polaritabrutte=rep(-1,length(parolebrutte))

#VALENCE

congavvers=c("ma", "pero", "anzi", "tuttavia", "eppure", "invece", "nondimeno"
             ,"bensi" , "d'altra parte", "d'altro canto","sebbene","nonostante","comunque",
             "benche","quantunque","malgrado","d'altronde","tutt'al piu", "detto cio","mentre")


amplificatori=c("assolutamente","senz'altro","certamente",
                "acutamente","sicuramente","senza dubbio","colossale","mastodontico",
                "colossalmente","notevolmente","considerevolmente","decisamente",
                "profondamente","enormemente","specialmente","particolarmente",
                "estremamente","molto","grandemente","pesantemente","assai","duramente",
                "altamente","immensamente","incalcolabile","maggiormente","pricipalmente",
                "massicciamente", "piu","di piu","moltissimo","tanto","in particolare","specificamente",
                "dettagliatamente","proposito","intenzionalmente"
                ,"abbastanza","piuttosto","proprio","completamente","del tutto","affatto"
                ,"esattamente","pienamente","interamente","veramente","realmente",
                "davvero","effettivamente","addirittura","gravemente","seriamente",
                "rigorosamente","significativo","totalmente","sinceramente",
                "vastamente","ampiamente","mostruosamente","incredibilmente","vivamente",
                "troppo","troppi","innumerevoli","abbondantemente","enormi","tantissimo","stra","esplicitamente",
                "nettamente","molta","gran","parecchio","fortemente")

negatori=c("non","nn","ne","mai","giammai","neppure","nemmeno","per niente",
           "neanche","no","nessuno","nullita","nessuna","niente","nulla","senza","nessun")

deamplificatori=c("quasi","pressoche","ormai","appena","a mala pena","apertamente",
                  "chiaramente","poveramente","debolmente","poca",
                  "alcuni","alcuno","alcuna","alcune","qualche","a stento","meno","minimo","minima",
                  "minime","minimi","minimamente","piccola","piccoli","piccole","piccina","piccini","piccine",
                  " piccolo","piccino","breve","corto","corta","corti","corte","alquanto","solo","soltanto",
                  "solamente","unicamente","puramente","in parte","parzialmente","raramente", "di rado",
                  "leggermente","lievemente","scarsamente","sottilmente","esilmente","un tipo","una specie",
                  "sorta","sporadicamente","pochissimo","pochissime","molto poco",
                  "molto poca","molta poca","molti pochi","molte poche","discreto","malapena","pochino","filino")

valore=c(rep(4,length(congavvers)),rep(2,length(amplificatori)),rep(1,length(negatori)),rep(3,length(deamplificatori)))

#COSTRUZIONE DIZIONARIO

#polarity_dt
pol <- data.frame(
  word=c(parolebelle,paroleneutre,parolebrutte),polarity=c(polaritabelle,polaritaneutre,polaritabrutte),
  stringsAsFactors = FALSE
)
pol2 <- as_key(pol)
is_key(pol2)

#valence_shifters_dt
vale <- data.frame(
  word=c(congavvers,amplificatori,negatori,deamplificatori),polarity=valore,
  stringsAsFactors = FALSE
)
vale2 <- as_key(vale,comparison = pol2)
is_key(vale2)

#punteggio
score=sentiment_by(text, polarity_dt = pol2,valence_shifters_dt = vale2)
punteggio=as.data.frame(score$ave_sentiment)



##########################################################################################
#TASTY INDEX
#########################################################################################
library(readxl)
Ristoranti <- read_excel("C:/Users/casam/Desktop/BastaRinominare.xlsx")
Ristoranti$Cucina=as.numeric(Ristoranti$Cucina)
Ristoranti$Servizio=as.numeric(Ristoranti$Servizio)
Ristoranti$Atmosfera=as.numeric(Ristoranti$Atmosfera)

#Funzione di penalità
y=function(x) exp(-5*x)


rece=Ristoranti$Recensioni
affidabili=which(rece>200)
inaffidabili=rece[-affidabili]
norma=(inaffidabili-min(inaffidabili))/(max(inaffidabili)-min(inaffidabili))
coeffRece=1-y(norma)


Ristoranti$coeff=1
Ristoranti$coeff[-affidabili]=coeffRece

Ristoranti$punteggio=punteggio$`score$ave_sentiment`
Ristoranti$punteggio[which(Ristoranti$punteggio<0)]=0
Ristoranti$punteggio=(Ristoranti$punteggio-min(Ristoranti$punteggio))/(max(Ristoranti$punteggio)-min(Ristoranti$punteggio))
Ristoranti$Sentiment=Ristoranti$punteggio*Ristoranti$coeff

Ristoranti$CucinaNorm=0
Ristoranti$CucinaNorm=(Ristoranti$Cucina-min(Ristoranti$Cucina))/(max(Ristoranti$Cucina)-min(Ristoranti$Cucina))

Ristoranti$ServizioNorm=0
Ristoranti$ServizioNorm=(Ristoranti$Servizio-min(Ristoranti$Servizio))/(max(Ristoranti$Servizio)-min(Ristoranti$Servizio))

Ristoranti$AtmosferaNorm=0
Ristoranti$AtmosferaNorm=(Ristoranti$Atmosfera-min(Ristoranti$Atmosfera))/(max(Ristoranti$Atmosfera)-min(Ristoranti$Atmosfera))

Ristoranti$QualitaPrezzoNorm=0
Ristoranti$QualitaPrezzoNorm=(Ristoranti$QualitaPrezzo-min(Ristoranti$QualitaPrezzo))/(max(Ristoranti$QualitaPrezzo)-min(Ristoranti$QualitaPrezzo))

Ristoranti$RumorositaNorm=0
Ristoranti$RumorositaNorm=(Ristoranti$Rumorosita-min(Ristoranti$Rumorosita))/(max(Ristoranti$Rumorosita)-min(Ristoranti$Rumorosita))

Ristoranti$TempoAttesaNorm=0
Ristoranti$TempoAttesaNorm=(Ristoranti$TempoAttesa-min(Ristoranti$TempoAttesa))/(max(Ristoranti$TempoAttesa)-min(Ristoranti$TempoAttesa))



####indice finale###
Ristoranti$Indice= 0.50*Ristoranti$Sentiment + 0.1*Ristoranti$CucinaNorm+
  0.1*Ristoranti$ServizioNorm+ 
  0.1*Ristoranti$AtmosferaNorm+0.1*Ristoranti$QualitaPrezzoNorm + 
  0.05*Ristoranti$RumorositaNorm+ 0.05*Ristoranti$TempoAttesaNorm

#write.table(file="Indice.txt", Ristoranti, row.names = FALSE,sep=";")


