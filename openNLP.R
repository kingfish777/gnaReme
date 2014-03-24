library(XML)
library(tm)
library(RCurl)
library(RTextTools)
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

# and so on
############################
# CREATE LANGUAGE MODELS
############################

###################
#VILLAINY LANGUAGE MODEL
###################
wd <- "/home/kingfish/proppian_function_language_models/Villainy"
setwd(wd)
text <- system.file("texts", "txt", package="tm")
corpus <- Corpus(DirSource('.'))
corpus <- tm_map(corpus, function(x) iconv(enc2utf8(x), sub = "byte"))
corpus <- tm_map(corpus, removeWords, stopwords("SMART"))
corpus <- tm_map(corpus, removeWords, c(stopwords("russian")))
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, removeNumbers)
corpus <- tm_map(corpus, tolower)
corpus <- tm_map(corpus, stripWhitespace)
####################
#VILLAINY
#dtm.villainy <- DocumentTermMatrix(corpus)
###########################
dtm.villainy <- create_matrix(cbind(as.vector(corpus)), language="russian", minDocFreq=1, maxDocFreq=Inf,
              minWordLength=3, maxWordLength=Inf, ngramLength=3, originalMatrix=NULL,
              removeNumbers=FALSE, removePunctuation=TRUE, removeSparseTerms=0,
              removeStopwords=TRUE, stemWords=FALSE, stripWhitespace=TRUE, toLower=TRUE,
              weighting=weightTf)
#rowTotals <- apply(dtm.villainy, 1, sum) #Find the sum of words in each Document
#dtm.villainy <- dtm.villainy[rowTotals> 0] #remove all docs without words
# dtm <- removeSparseTerms(dtm, 0.99)
lsa.villainy <- lsa(dtm.villainy, dims = dimcalc_share(share = .5))
lsa_k.villainy <- lsa(dtm.villainy, dims = dimcalc_kaiser())
plot(dtm.villainy)
plot(dtm.villainy, corThreshold = 0.5)
plot(dtm.villainy, corThreshold = 0.5, terms = findFreqTerms(dtm.villainy, 6, Inf))
inspect(corpus)[[20]]
summary(lsa.villainy)
######

###################
#LACK LANGUAGE MODEL
###################
wd <- "/home/kingfish/proppian_function_language_models/Lack"
setwd(wd)
text <- system.file("texts", "txt", package="tm")
corpus <- Corpus(DirSource('.'))
corpus <- tm_map(corpus, function(x) iconv(enc2utf8(x), sub = "byte"))
corpus <- tm_map(corpus, removeWords, stopwords("SMART"))
corpus <- tm_map(corpus, removeWords, c(stopwords("english")))
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, removeNumbers)
corpus <- tm_map(corpus, tolower)
corpus <- tm_map(corpus, stripWhitespace)
####################
#VILLAINY
#dtm.villainy <- DocumentTermMatrix(corpus)
###########################
dtm.lack <- create_matrix(cbind(as.vector(corpus)), language="english", minDocFreq=1, maxDocFreq=Inf,
              minWordLength=3, maxWordLength=Inf, ngramLength=3, originalMatrix=NULL,
              removeNumbers=FALSE, removePunctuation=TRUE, removeSparseTerms=0,
              removeStopwords=TRUE, stemWords=FALSE, stripWhitespace=TRUE, toLower=TRUE,
              weighting=weightTf)
rowTotals <- apply(dtm.lack, 1, sum) #Find the sum of words in each Document
dtm.lack <- dtm.lack[rowTotals> 0] #remove all docs without words
# dtm <- removeSparseTerms(dtm, 0.99)
lsa.lack <- lsa(dtm.lack, dims = dimcalc_share(share = .5))
lsa_k.lack <- lsa(dtm.lack, dims = dimcalc_kaiser())
plot(dtm.lack)
plot(dtm.lack, corThreshold = 0.5)
plot(dtm.lack, corThreshold = 0.5, terms = findFreqTerms(dtm.lack, 6, Inf))
inspect(corpus)[[20]]
summary(lsa.lack)
######
tm::Zipf_plot(dtm.villainy)
tm::Heaps_plot(dtm.villainy) 


