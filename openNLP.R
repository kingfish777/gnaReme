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
LiquidationOfLack <- getNodeSet(tale, "//Corpus//Folktale//Move//LiquidationOfLack")
LiquidationOfLack
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
#writeLines(zip, "/home/hinckley/Public/monkey2.txt") #save text locally
#
##############
# Extract Proppian functions from corpus
##############
#functionVector <- list(Villainy, Lack, LiquidationOfLack, DonorFunction, HeroReaction, 
#                    AcquisitionOfMagicalAgent, Wedding, Epilogue, RecognitionOfHero)


#createCorpus <- function(x) {
 #x <- as.character(x)
# print(x)
# for (i in 1:length(x))
#  { print(getChildrenStrings(x[[i]]))
#    print(as.character(x))
    #writeLines(as.character(getChildrenStrings(x[[i]])), paste("/home/kingfish/", as.character(x), as.character(i), ".txt", sep=""))
#    }
# for (i in 1:length(x)) 
#  { writeLines(as.character(getChildrenStrings(x[[i]])), paste("/home/kingfish/proppian_function_language_models/",as.character(x), "/",as.character(x), as.character(i), ".txt", sep=""))  } 
#}

#lapply(functionVector, createCorpus)

for (i in 1:length(Villainy)) 
 { writeLines(as.character(getChildrenStrings(Villainy[[i]])), paste("/home/kingfish/proppian_function_language_models/Villainy/Villainy", as.character(i), ".txt", sep=""))  } 

for (i in 1:length(Lack)) 
 { writeLines(as.character(getChildrenStrings(Villainy[[i]])), paste("/home/kingfish/proppian_function_language_models/Lack/Lack", as.character(i), ".txt", sep=""))  } 
 
 

for (i in 2:length(Return)) 
 { writeLines(as.character(getChildrenStrings(Return[[i]])), paste("/home/kingfish/proppian_function_language_models/Return/Return", as.character(i), ".txt", sep=""))  } 
 
 
 
