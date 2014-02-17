library(XML)
library(tm)
library(RCurl)
url <- "http://clover.slavic.pitt.edu/sam/propp/have_a_little_byte/magicgeese.xml"
#url <- "http://www.maleclabs.com/Propp/Corpus.xml"
tale <- xmlTreeParse(getURL(url), useInternal = T)
tale
initsit <- xmlValue(getNodeSet(tale, "//Corpus//Folktale//Move//Preparation//InitialSituation")[[1]])
initsit
return <- xmlValue(getNodeSet(tale, "//Corpus//Folktale//Move//Return")[[1]])
return
library(openNLP)
# sentDetect(initsit, language = "en", model = NULL)
y <- tagPOS(initsit, language = "en", model = NULL, tagdict = NULL)
y
