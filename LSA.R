library(tm)
library(lsa)
library(Rgraphviz)
library(RTextTools)
rm(list=ls())
setwd("/home/propp/Desktop/Sites/MalecLabs.com/Propp/Afan_Magnus_Leonard_trans_1916/");
# setwd("/home/propp/Desktop/Propp/AutoProppCorpus/Afan_Eng/");
# setwd("/home/propp/Desktop/Propp/AutoProppCorpus/AfanSources/");
# setwd("/home/propp/Desktop/patents/");
# setwd("/home/propp/Desktop/Propp/AutoProppCorpus/PhilSources/Plato/")
txt <- system.file("texts", "txt", package = "tm")
corpus <- Corpus(DirSource(), readerControl = list(language = "eng"))
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, tolower)
corpus <- tm_map(corpus, stripWhitespace)
corpus <- tm_map(corpus, removeWords, stopwords("english"))
corpus <- tm_map(corpus, stemDocument)
# dtm <- DocumentTermMatrix(corpus)
dtm <- create_matrix(cbind(as.vector(corpus)), language="english", minDocFreq=1, maxDocFreq=Inf, 
              minWordLength=3, maxWordLength=Inf, ngramLength=3, originalMatrix=NULL, 
              removeNumbers=FALSE, removePunctuation=TRUE, removeSparseTerms=0, 
              removeStopwords=TRUE,  stemWords=FALSE, stripWhitespace=TRUE, toLower=TRUE, 
              weighting=weightTf)
rowTotals <- apply(dtm , 1, sum) #Find the sum of words in each Document
dtm   <- dtm[rowTotals> 0]           #remove all docs without words
# dtm <- removeSparseTerms(dtm, 0.99)
lsa <- lsa(dtm, dims = dimcalc_share(share = .5))
lsa_k <- lsa(dtm, dims = dimcalc_kaiser())
plot(dtm)
plot(dtm, corThreshold = 0.5)
plot(dtm, corThreshold = 0.5, terms = findFreqTerms(dtm, 6, Inf))
inspect(corpus)[[20]] 
summary(lsa)
######
