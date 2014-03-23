library(XML)
library(tm)
library(RCurl)
#url <- "http://clover.slavic.pitt.edu/sam/propp/have_a_little_byte/magicgeese.xml"
setwd("/home/kingfish")
url <- "Corpus_Rus.xml"
tale <- xmlTreeParse(getURL(url), useInternal = T)
tale
#
initsit <- xmlValue(getNodeSet(tale, "//Corpus//Folktale//Move//Preparation//InitialSituation"))
initsit

Return <- xmlValue(getNodeSet(tale, "//Corpus//Folktale//Move//Return"))
Return
#
Trans <- getNodeSet(tale, "//Corpus//Folktale//Move//Transfiguration")
Trans
#
Villainy <- getNodeSet(tale, "//Corpus//Folktale//Move//Villainy")
Villainy
#
Lack <- getNodeSet(tale, "//Corpus//Folktale//Move//Lack")
Lack
#
DonorFunction <- getNodeSet(tale, "//Corpus//Folktale//Move//DonorFunction")
DonorFunction
#
HeroReaction <- getNodeSet(tale, "//Corpus//Folktale//Move//HeroReaction")
HeroReaction
#
AcquisitionOfMagicalAgent <- getNodeSet(tale, "//Corpus//Folktale//Move//AcquisitionOfMagicalAgent")
AcquisitionOfMagicalAgent
#
Wedding <- getNodeSet(tale, "//Corpus//Folktale//Move//Wedding")
Wedding
#
Epilogue <- getNodeSet(tale, "//Corpus//Folktale//Move//Epilogue")
Epilogue
#
RecognitionOfHero <- getNodeSet(tale, "//Corpus//Folktale//Move//RecognitionOfHero")
RecognitionOfHero
#


