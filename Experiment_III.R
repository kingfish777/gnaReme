#######################################################################
#EXPERIMENT IV (formerly EXPERIMENT III)
# texttiling snippets of Russian magic tales (textTiling divides texts into "paragraphs"/topical parts)
#
#results would like something like this ===>
#
# each "raw" fairy tale resulting text tiles will be compared with language models of various functions:
#93_SolntsSe   93_SolntsSestra.txt                             94_Morozko.txt          95_Morozko.txt       etc.
#                  1     ii      iii     iv        v      vi     i    ii    iii    iv    i  ii   iii iv
#   i            1 .0002  .0003 .002 .05    .09   .0394  .01 .014 .1  .001
#   ii          .0002   1       etc.
#   iii         .03    .002      1  etc.
#   iv           
#  etc.
#94_Morozko.txt
#
#
#95_Morozko.txt
# etc.
#
# PURPOSE:    demonstrate how this algorithm can be used to determine the structure
#             of 'raw' magic tale narratives #
#
# HYPOTHESIS: relatively placed sections of formulaic content is more similar 
#             to each other than the particular larger work from which it came
#
# corollary:  in Russian magic tales, TextTiles of folk tales (content objects) 
#             are similar to Proppian functions and could be used with other 
#             unsupervised machine learning algorithms to categorize folktales
#
#
######################################################################

library(rPython)
library(tm)
library(RTextTools)
########################################################################
python.exec("import nltk")
python.exec("import nltk.corpus")
python.exec("from nltk.corpus import PlaintextCorpusReader")
python.exec("from urllib import urlopen")
python.exec("import numpy")

#CLEANUP!!!
setwd("/home/kingfish/proppian_function_language_models/ProppModel-master")
originalwd <- getwd()
folderPath <- originalwd
setwd(folderPath)
text <- system.file("texts", "txt", package="tm")
corpus <- Corpus(DirSource('.'))
corpus <- tm_map(corpus, function(x) iconv(enc2utf8(x), sub = "byte"))
corpus <- tm_map(corpus, removeWords, stopwords("SMART"))
corpus <- tm_map(corpus, removeWords, c(stopwords("english")))
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, removeNumbers)
corpus <- tm_map(corpus, tolower)
corpus <- tm_map(corpus, stripWhitespace)
setwd("/home/kingfish/proppian_function_language_models/ProppModel-master")
tm::writeCorpus(x=corpus, path="/home/kingfish/proppian_function_language_models/Experiment")
fPath = "/home/kingfish/proppian_function_language_models/Experiment"

fileList <- list.files(path=fPath)
fileList <- as.list(list.files(path=folderPath))
fileList

textTilize <- function(sourceFolderPath, targetFolderPath) {
  fileList <- as.list(list.files(path=sourceFolderPath))
  for (counter in 1:length(fileList)) {
    print(as.character(fileList[[counter]]))
    python.exec(paste("url = \"/home/kingfish/proppian_function_language_models/Experiment/",as.character(fileList[[counter]]), "\"", sep="") )
    # replace this folder above with sourceFolderPath reference
    python.exec("raw = urlopen(url).read()")
    python.exec("ttt = nltk.tokenize.TextTilingTokenizer(w=7, k=3, smoothing_width = 6, smoothing_rounds = 10)")
    python.get("raw")
    try(python.exec(paste("tiles = ttt.tokenize(raw)")))
    textTiles <- python.get("tiles")
    for (i in 1:length(textTiles)) {
      #writeLines(textTiles[i], paste(targetFolderPath, "textTile_", i, "_", as.character(fileList[[counter]]), sep=""))
      writeLines(textTiles[i], paste(targetFolderPath, i, "_", as.character(fileList[[counter]]), sep=""))
    }
  }
}

sfp <- "/home/kingfish/proppian_function_language_models/Experiment/"
tfp <-"/home/kingfish/proppian_function_language_models/TextTiles/"
textTilize(sfp,tfp)

# TO DO =========> 
#  * cleanup (MUST!!!)
#  * loops for parameters for texttiling
#  * use TRY EXCEPTION for graceful exception handling
#  * classification methods: KNN
#  * strip out named entities with primitive RegExp search/replace for non-word initial capitals
#  * sentence-sized snippets? 

setwd("/home/kingfish/proppian_function_language_models/TextTiles")
text <- system.file("texts", "txt", package="tm")
corpus <- Corpus(DirSource('.'))
corpus <- tm_map(corpus, function(x) iconv(enc2utf8(x), sub = "byte"))
corpus <- tm_map(corpus, removeWords, stopwords("SMART"))
corpus <- tm_map(corpus, removeWords, c(stopwords("english")))
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, removeNumbers)
corpus <- tm_map(corpus, tolower)
corpus <- tm_map(corpus, stripWhitespace)
training_matrix <- DocumentTermMatrix(corpus,
                                  control = list(weighting =
                                                   function(x)
                                                     weightTfIdf(x, normalize =
                                                                   FALSE),
                                                 stopwords = TRUE))

##############clean corpus

dtm_complete <- hclust(dist(training_matrix), members=NULL, method="centroid")
plot(dtm_complete, xlab="text from corpus", "ylab"="distance", main="Cluster Dendrogram \n of Various Russian Magic Tales")
op = par(bg="#DDE3CA")
plot(dtm_complete, col="#487AA1", col.main="#45ADA8", col.lab="#7C8071",
     col.axis="#F38630", lwd=1, lty=1, sub='', hang=-1, axes=FALSE,
     main = "Cluster Dendrogram Representing \n Magic Tale Similarity",
     xlab="Magic Tale Name", ylab = "Distance given absence/presence of Proppian Functions/Narremes")
nplot(dtm_complete, hang=1, axes = TRUE, ann=TRUE, main = "Cluster Dendrogram Representing Magic Tale Similarity",
      xlab="Magic Tale Name", ylab = "Distance")

cleanCorpus <- function(corpus) {
    corpus.tmp <- tm_map(corpus, tolower)
    corpus.tmp <- tm_map(corpus.tmp, removePunctuation)
    corpus.tmp <- tm_map(corpus.tmp, removeWords, stopwords("english"))
    corpus.tmp <- tm_map(corpus.tmp, stripWhitespace)
    corpus.tmp <- tm_map(corpus.tmp, stemDocument)
  return(corpus.tmp)
}

corpus <- cleanCorpus(corpus)

tdm <- TermDocumentMatrix(corpus)
tdm <- removeSparseTerms(tdm, 0.99)
tdm <- as.matrix(tdm)

word_freqs <- sort(rowSums(tdm), decreasing=TRUE)
length(word_freqs)
glossary <- PlainTextDocument(names(word_freqs))
corpus.fin <- tm_map(corpus, stemCompletion, dictionary=glossary, type="first")

#multilabel classification
#############################################################################
# http://scikit-learn.org/dev/auto_examples/plot_multilabel.html            #
#                                                                           #
#############################################################################
#############################################################################
