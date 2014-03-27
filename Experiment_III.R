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
mode(fileList)
length(fileList)
fileList <- as.list(list.files(path=folderPath))
fileList

textTilize <- function(sourceFolderPath, targetFolderPath) {
  fileList <- as.list(list.files(path=sourceFolderPath))
  for (counter in 1:length(fileList)) {
    python.exec(paste("url = \"/home/kingfish/proppian_function_language_models/Experiment/",as.character(fileList[[counter]]), "\"", sep="")  )
    # replace this folder above with sourceFolderPath reference
    python.exec("raw = urlopen(url).read()")
    python.exec("ttt = nltk.tokenize.TextTilingTokenizer(w=7, k=3, smoothing_width = 6, smoothing_rounds = 10)")
    python.get("raw")
    python.exec(paste("tiles = ttt.tokenize(raw)"))
    textTiles <- python.get("tiles")
    for (i in 1:length(textTiles)) {
       writeLines(textTiles, paste(tfp, as.character(fileList[[counter]]), "_textTile_", i, "txt", sep=""))
    }
  }
}

sfp <- "/home/kingfish/proppian_function_language_models/Experiment/"
tgp <-"/home/kingfish/proppian_function_language_models/TextTiles/"
textTilize(sfp,tfp)

# TO DO =========> 
#  * loops for parameters for texttiling
#  * use TRY EXCEPTION for graceful exception handling
#  * classification methods: KNN, 
#  * strip out named entities with primitive RegExp search/replace for non-word initial capitals

library("lsa")
# load training texts
training_matrix = textmatrix("/home/kingfish/proppian_function_language_models/Lack")
# calculate tfidf
training_matrix = lw_bintf(training_matrix) * gw_idf(training_matrix) #weighting
lsa_space = lsa(training_matrix) # create LSA space
# fold-in test and gold standard snippets
test_gold_matrix = textmatrix("/home/kingfish/proppian_function_language_models/Villainy", vocabulary=rownames(training_matrix))
test_gold_matrix = lw_bintf(test_gold_matrix) * gw_idf(test_gold_matrix) #weighting
# set NULLs to zeroes
test_gold_matrix[is.na(test_gold_matrix)] <- 0
test_gold_matrix_space = fold_in(test_gold_matrix, lsa_space)
# score snippet against gold standard
# remove subscripts for comparison matrix of all texts
cor(test_gold_matrix_space, test_gold_matrix_space)
#calculate mean correlation score of test snippet against training and gold snippets
mean(cor(test_gold_matrix_space, test_gold_matrix_space[,"Wedding2.txt"]))


