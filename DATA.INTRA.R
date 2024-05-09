library(flexdashboard)
library(plotly)
library(rvest)
library(XML)
library(ggplot2)




#############Importation de donnees###################
Taux<-read_html("https://www.brh.ht/taux-du-jour/")
tables<-Taux%>%html_table(fill=TRUE)
Table1<-tables[[1]]

Taux<-read_html("https://www.brh.ht/taux-affiches-par-les-banques-et-les-agents-de-change-2/")
tables<-Taux%>%html_table(fill=TRUE)
Table2<-tables[[1]]



############Manipulation de donnees#############
####Transformation des tables en data frame 
Table1<-data.frame(Table1)
Table1
Table2<-data.frame(Table2)
Table2
Table2<-Table2%>%rename(Banques='Var.1')
Table2
Table2<-Table2[-c(8:11),-c(2)]
Table2


########creation de nouvelles variables
sj<-Table1[1,]
sj
Sj<-t(sj)

####Graphique du taux pour un meilleur arbitrage########

##Dans ce Graphe je fais un rapprochement entre le taux a l'achat 
#et le spread ce qui resulte en un affichage du taux a la vente.
#Par rapport a ce graphique, un arbitragiste en possession du dollar 
#americain (USD) peut derminer laquelle des banques affiche le meilleur taux
#pour realiser un meilleur benefice en raison des marges entre achat et vente.

