##############################################################
#
# Licensed under GPL3 by Scott Alexander Malec (MalecLabs.com)
# for more information, see:
# http://www.gnu.org/licenses/gpl-3.0.txt
###############################################################
#
#this reads in PFTML, dumps content of function snippets as files into  respective folders
#build language models from those folders
#
#-----------------------------------------------------------------------------
#
#next steps:
# ---> more data markup and cleanup (in Russian and English) [in paper we can show preliminary results)
#----> turn the experiment into a 'machine' (that is, something that happens without human intervention, quasi randomized and reproducible)
####
####

library(XML)
library(tm)
library(RTextTools)
library(ape)
#url <- "http://clover.slavic.pitt.edu/sam/propp/have_a_little_byte/magicgeese.xml"
setwd("/amanuensis/data/proppian_function_language_models/")
doc <- "Corpus_Rus.xml"
tale <- xmlTreeParse(doc, useInternal = T)
tale
#
initsit <- getNodeSet(tale, "//Corpus//Folktale//Move//Preparation//InitialSituation")
initsit

Return <- getNodeSet(tale, "//Corpus//Folktale//Move//Return")
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
 { writeLines(as.character(getChildrenStrings(Lack[[i]])), paste("/home/kingfish/proppian_function_language_models/Lack/Lack", as.character(i), ".txt", sep=""))  } 

for (i in 1:length(DonorFunction)) 
 { writeLines(as.character(getChildrenStrings(DonorFunction[[i]])), paste("/home/kingfish/proppian_function_language_models/DonorFunction/DonorFunction", as.character(i), ".txt", sep=""))  } 
 
for (i in 2:length(HeroReaction)) 
 { writeLines(as.character(getChildrenStrings(HeroReaction[[i]])), paste("/home/kingfish/proppian_function_language_models/HeroReaction/HeroReaction", as.character(i), ".txt", sep=""))  } 

for (i in 1:length(AcquisitionOfMagicalAgent)) 
 { writeLines(as.character(getChildrenStrings(AcquisitionOfMagicalAgent[[i]])), paste("/home/kingfish/proppian_function_language_models/AcquisitionOfMagicalAgent/AcquisitionOfMagicalAgent", as.character(i), ".txt", sep=""))  } 

for (i in 1:length(LiquidationOfLack)) 
 { writeLines(as.character(getChildrenStrings(LiquidationOfLack[[i]])), paste("/home/kingfish/proppian_function_language_models/LiquidationOfLack/LiquidationOfLack", as.character(i), ".txt", sep=""))  } 
 
for (i in 1:length(Return)) 
 { writeLines(as.character(getChildrenStrings(Return[[i]])), paste("/home/kingfish/proppian_function_language_models/Return/Return", as.character(i), ".txt", sep=""))  } 

for (i in 1:length(Transfiguration))
 { writeLines(as.character(getChildrenStrings(Transfiguration[[i]])), paste("/home/kingfish/proppian_function_language_models/Transfiguration/Transfiguration", as.character(i), ".txt", sep="")) }

for (i in 1:length(Wedding)) 
 { writeLines(as.character(getChildrenStrings(Wedding[[i]])), paste("/home/kingfish/proppian_function_language_models/Wedding/Wedding", as.character(i), ".txt", sep=""))  } 

for (i in 1:length(Epilogue)) 
 { writeLines(as.character(getChildrenStrings(Epilogue[[i]])), paste("/home/kingfish/proppian_function_language_models/Epilogue/Epilogue", as.character(i), ".txt", sep=""))  } 


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
#Lack
#dtm.lack <- DocumentTermMatrix(corpus)
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
tm::Zipf_plot(dtm.lack)
tm::Heaps_plot(dtm.lack) 



###################
#CARDINAL FUNCTION MODEL
###################
wd <- "/home/kingfish/proppian_function_language_models/Cardinal"
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
#Cardinal
#dtm.cardinal <- DocumentTermMatrix(corpus)
###########################
dtm.cardinal <- create_matrix(cbind(as.vector(corpus)), language="english", minDocFreq=1, maxDocFreq=Inf,
              minWordLength=3, maxWordLength=Inf, ngramLength=3, originalMatrix=NULL,
              removeNumbers=FALSE, removePunctuation=TRUE, removeSparseTerms=0,
              removeStopwords=TRUE, stemWords=FALSE, stripWhitespace=TRUE, toLower=TRUE,
              weighting=weightTf)
rowTotals <- apply(dtm.cardinal, 1, sum) #Find the sum of words in each Document
dtm.lack <- dtm.cardinal[rowTotals> 0] #remove all docs without words
# dtm <- removeSparseTerms(dtm, 0.99)
lsa.cardinal <- lsa(dtm.cardinal, dims = dimcalc_share(share = .5))
lsa_k.cardinal <- lsa(dtm.cardinal, dims = dimcalc_kaiser())
plot(dtm.cardinal)
plot(dtm.cardinal, corThreshold = 0.5)
plot(dtm.cardinal, corThreshold = 0.5, terms = findFreqTerms(dtm.cardinal, 6, Inf))
inspect(corpus)[[20]]
summary(lsa.cardinal)
######
tm::Zipf_plot(dtm.cardinal)
tm::Heaps_plot(dtm.cardinal) 





###################
#DONOR FUNCTION LANGUAGE MODEL
###################
wd <- "/home/kingfish/proppian_function_language_models/DonorFunction"
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
#Donor Function
#dtm.donorfunction <- DocumentTermMatrix(corpus)
###########################
dtm.df <- create_matrix(cbind(as.vector(corpus)), language="english", minDocFreq=1, maxDocFreq=Inf,
              minWordLength=3, maxWordLength=Inf, ngramLength=3, originalMatrix=NULL,
              removeNumbers=FALSE, removePunctuation=TRUE, removeSparseTerms=0,
              removeStopwords=TRUE, stemWords=FALSE, stripWhitespace=TRUE, toLower=TRUE,
              weighting=weightTf)
rowTotals <- apply(dtm.df, 1, sum) #Find the sum of words in each Document
dtm.lack <- dtm.df[rowTotals> 0] #remove all docs without words
# dtm <- removeSparseTerms(dtm, 0.99)
lsa.df <- lsa(dtm.df, dims = dimcalc_share(share = .5))
lsa_k.df <- lsa(dtm.df, dims = dimcalc_kaiser())
plot(dtm.df)
plot(dtm.df, corThreshold = 0.5)
plot(dtm.df, corThreshold = 0.5, terms = findFreqTerms(dtm.df, 6, Inf))
inspect(corpus)[[20]]
summary(lsa.lack)
######
tm::Zipf_plot(dtm.lack)
tm::Heaps_plot(dtm.lack) 



###################
#HERO REACTION LANGUAGE MODEL
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
#Hero Reaction
#dtm.hr <- DocumentTermMatrix(corpus)
###########################
dtm.hr <- create_matrix(cbind(as.vector(corpus)), language="english", minDocFreq=1, maxDocFreq=Inf,
              minWordLength=3, maxWordLength=Inf, ngramLength=3, originalMatrix=NULL,
              removeNumbers=FALSE, removePunctuation=TRUE, removeSparseTerms=0,
              removeStopwords=TRUE, stemWords=FALSE, stripWhitespace=TRUE, toLower=TRUE,
              weighting=weightTf)
rowTotals <- apply(dtm.hr, 1, sum) #Find the sum of words in each Document
dtm.hr <- dtm.hr[rowTotals> 0] #remove all docs without words
# dtm <- removeSparseTerms(dtm, 0.99)
lsa.hr <- lsa(dtm.hr, dims = dimcalc_share(share = .5))
lsa_k.hr <- lsa(dtm.hr, dims = dimcalc_kaiser())
plot(dtm.hr)
plot(dtm.hr, corThreshold = 0.5)
plot(dtm.hr, corThreshold = 0.5, terms = findFreqTerms(dtm.hr, 6, Inf))
inspect(corpus)[[20]]
summary(lsa.hr)
######
tm::Zipf_plot(dtm.hr)
tm::Heaps_plot(dtm.hr) 






###################
#ACQUISITION OF MAGICAL AGENT LANGUAGE MODEL
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
#Acquisition of Magical Agent 
#dtm.ama <- DocumentTermMatrix(corpus)
###########################
dtm.ama <- create_matrix(cbind(as.vector(corpus)), language="english", minDocFreq=1, maxDocFreq=Inf,
              minWordLength=3, maxWordLength=Inf, ngramLength=3, originalMatrix=NULL,
              removeNumbers=FALSE, removePunctuation=TRUE, removeSparseTerms=0,
              removeStopwords=TRUE, stemWords=FALSE, stripWhitespace=TRUE, toLower=TRUE,
              weighting=weightTf)
rowTotals <- apply(dtm.lack, 1, sum) #Find the sum of words in each Document
dtm.ama <- dtm.lack[rowTotals> 0] #remove all docs without words
# dtm <- removeSparseTerms(dtm, 0.99)
lsa.ama <- lsa(dtm.ama, dims = dimcalc_share(share = .5))
lsa_k.ama <- lsa(dtm.ama, dims = dimcalc_kaiser())
plot(dtm.ama)
plot(dtm.ama, corThreshold = 0.5)
plot(dtm.ama, corThreshold = 0.5, terms = findFreqTerms(dtm.ama, 6, Inf))
inspect(corpus)[[20]]
summary(lsa.ama)
######
tm::Zipf_plot(dtm.ama)
tm::Heaps_plot(dtm.ama) 




###################
#LIQUIDATION OF LACK LANGUAGE MODEL
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
#Liquidation of Lack
#dtm.liq <- DocumentTermMatrix(corpus)
###########################
dtm.liq <- create_matrix(cbind(as.vector(corpus)), language="english", minDocFreq=1, maxDocFreq=Inf,
              minWordLength=3, maxWordLength=Inf, ngramLength=3, originalMatrix=NULL,
              removeNumbers=FALSE, removePunctuation=TRUE, removeSparseTerms=0,
              removeStopwords=TRUE, stemWords=FALSE, stripWhitespace=TRUE, toLower=TRUE,
              weighting=weightTf)
rowTotals <- apply(dtm.lack, 1, sum) #Find the sum of words in each Document
dtm.liq <- dtm.lack[rowTotals> 0] #remove all docs without words
# dtm <- removeSparseTerms(dtm, 0.99)
lsa.liq <- lsa(dtm.liq, dims = dimcalc_share(share = .5))
lsa_k.liq <- lsa(dtm.liq, dims = dimcalc_kaiser())
plot(dtm.liq)
plot(dtm.liq, corThreshold = 0.5)
plot(dtm.liq, corThreshold = 0.5, terms = findFreqTerms(dtm.liq, 6, Inf))
inspect(corpus)[[20]]
summary(lsa.liq)
######
tm::Zipf_plot(dtm.liq)
tm::Heaps_plot(dtm.liq) 









###################
#RETURN LANGUAGE MODEL
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
#Return
#dtm.return <- DocumentTermMatrix(corpus)
###########################
dtm.return <- create_matrix(cbind(as.vector(corpus)), language="english", minDocFreq=1, maxDocFreq=Inf,
              minWordLength=3, maxWordLength=Inf, ngramLength=3, originalMatrix=NULL,
              removeNumbers=FALSE, removePunctuation=TRUE, removeSparseTerms=0,
              removeStopwords=TRUE, stemWords=FALSE, stripWhitespace=TRUE, toLower=TRUE,
              weighting=weightTf)
rowTotals <- apply(dtm.return, 1, sum) #Find the sum of words in each Document
dtm.return <- dtm.return[rowTotals> 0] #remove all docs without words
# dtm <- removeSparseTerms(dtm, 0.99)
lsa.return <- lsa(dtm.return, dims = dimcalc_share(share = .5))
lsa_k.return <- lsa(dtm.return, dims = dimcalc_kaiser())
plot(dtm.return)
plot(dtm.return, corThreshold = 0.5)
plot(dtm.return, corThreshold = 0.5, terms = findFreqTerms(dtm.return, 6, Inf))
inspect(corpus)[[20]]
summary(lsa.return)
######
tm::Zipf_plot(dtm.return)
tm::Heaps_plot(dtm.return) 





###################
#WEDDING LANGUAGE MODEL
###################
wd <- "/home/kingfish/proppian_function_language_models/Wedding"
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
#WEDDING
#dtm.villainy <- DocumentTermMatrix(corpus)
###########################
dtm.wedding <- create_matrix(cbind(as.vector(corpus)), language="russian", minDocFreq=1, maxDocFreq=Inf,
              minWordLength=3, maxWordLength=Inf, ngramLength=3, originalMatrix=NULL,
              removeNumbers=FALSE, removePunctuation=TRUE, removeSparseTerms=0,
              removeStopwords=TRUE, stemWords=FALSE, stripWhitespace=TRUE, toLower=TRUE,
              weighting=weightTf)
#rowTotals <- apply(dtm.villainy, 1, sum) #Find the sum of words in each Document
#dtm.villainy <- dtm.villainy[rowTotals> 0] #remove all docs without words
# dtm <- removeSparseTerms(dtm, 0.99)
lsa.wedding <- lsa(dtm.wedding, dims = dimcalc_share(share = .5))
lsa_k.wedding <- lsa(dtm.wedding, dims = dimcalc_kaiser())
plot(dtm.wedding)
plot(dtm.wedding, corThreshold = 0.5)
plot(dtm.wedding, corThreshold = 0.5, terms = findFreqTerms(dtm.wedding, 6, Inf))
inspect(corpus)[[20]]
summary(lsa.wedding)
######






###################
#EPILOGUE LANGUAGE MODEL
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
#Epilogue
#dtm.epilogue <- DocumentTermMatrix(corpus)
###########################
dtm.epilogue <- create_matrix(cbind(as.vector(corpus)), language="english", minDocFreq=1, maxDocFreq=Inf,
              minWordLength=3, maxWordLength=Inf, ngramLength=3, originalMatrix=NULL,
              removeNumbers=FALSE, removePunctuation=TRUE, removeSparseTerms=0,
              removeStopwords=TRUE, stemWords=FALSE, stripWhitespace=TRUE, toLower=TRUE,
              weighting=weightTf)
rowTotals <- apply(dtm.epilogue, 1, sum) #Find the sum of words in each Document
dtm.epilogue <- dtm.epilogue[rowTotals> 0] #remove all docs without words
# dtm <- removeSparseTerms(dtm, 0.99)
lsa.epilogue <- lsa(dtm.epilogue, dims = dimcalc_share(share = .5))
lsa_k.epilogue <- lsa(dtm.epilogue, dims = dimcalc_kaiser())
plot(dtm.epilogue)
plot(dtm.epilogue, corThreshold = 0.5)
plot(dtm.epilogue, corThreshold = 0.5, terms = findFreqTerms(dtm.lack, 6, Inf))
inspect(corpus)[[20]]
summary(lsa.lack)
######
tm::Zipf_plot(dtm.epilogue)
tm::Heaps_plot(dtm.epilogue) 













dtm_complete.v <- hclust(dist(dtm.villainy), method="ward")
dtm_distro.v <- hclust(dist(dtm.villainy), method="centroid")
###############################################
# plot hierarchical dendrogram of cluster of tale/function matrix
###############################################
plot(hclust(dist(dtm.villainy), method="complete"), xlab="text from corpus", "ylab"="distance", main="Cluster Dendrogram \n of Various Russian Magic Tales")

op = par(bg="#DDE3CA")
plot(dtm_complete.v, col="#487AA1", col.main="#45ADA8", col.lab="#7C8071",
     col.axis="#F38630", lwd=1, lty=1, sub='', hang=-1, axes=FALSE,
     main = "Cluster Dendrogram Representing \n Magic Tale Similarity",
     xlab="Magic Tale Name", ylab = "Distance given absence/presence of Proppian Functions/Narremes")
################################################
# plot cluster dendrogram representing magic tale similarity
################################################
par(op)
plot(dtm_complete.v, hang=1, axes = TRUE, ann=TRUE, main = "Cluster Dendrogram Representing Magic Tale Similarity",
     xlab="Magic Tale Name", ylab = "Distance")
     
################################################
# work on this ---> ape package functionality
################################################
phyl <- as.phylo(hclust(dtm_distro.v))
plot(phyl, edge.col=c("blue", "green", "red")[c(TRUE, FALSE) + 1 + (phyl$edge.length > 20)])



###########
#Threw a 'Wedding' into 'Villainy'

plot(hclust(dist(DocumentTermMatrix(corpus)), method="complete"))

###########
###########
# use TEXT TILING to TEST SNIPPETS
# bring in daily mail, myron magnet, ann coulter, SOTUS, Necronomicon, etc.
#
# create texttilingSegmenterFunction from this --->
# https://github.com/kingfish777/gnaReme/blob/master/texttilingSegmentation.R








