library(XML)
library(tm)
library(RCurl)
#url <- "http://clover.slavic.pitt.edu/sam/propp/have_a_little_byte/magicgeese.xml"
setwd("/home/kingfish")
url <- "Corpus_Rus.xml"
tale <- xmlTreeParse(getURL(url), useInternal = T)
tale
initsit <- xmlValue(getNodeSet(tale, "//Corpus//Folktale//Move//Preparation//InitialSituation")[[1]])
initsit
return <- xmlValue(getNodeSet(tale, "//Corpus//Folktale//Move//Return")[[1]])
return

Trans <- getNodeSet(tale, "//Corpus//Folktale//Move//Transfiguration")
Trans

Villainy <- getNodeSet(tale, "//Corpus//Folktale//Move//Villainy")
Villainy

Lack <- getNodeSet(tale, "//Corpus//Folktale//Move//Lack")
Lack

