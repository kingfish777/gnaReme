#########################################################################
# Copyright (c) 2014 All Rights Reserved, Scott Alexander Malec
#
# This source is free to use and distribute so long as credit is provided.
# This code is provided "AS IS" without warranty of any kind, either
# expressed or implied, including but not limited to the implied
# warranties of merchantability and/or fitness for a particular purpose.
#
# Author: Scott Alexander Malec
# Email: scott [dot] malec [at] gmail [dot] com
# Date: 3/23/2014
#
# TITLE: rPython_NLTK.R
#
# Purpose: R Tools to interface with Python NLTK's implementation of Marti Heart's
# TextTiling algorithm
#
#########################################################################
# python nltk integration --- using Marti Hearst's textiling algorithm
#  textiling uses a roving text window to identify breaks in the topical structure within a text
#  http://people.ischool.berkeley.edu/~hearst/research/tiling.html
#  http://clover.slavic.pitt.edu/sam/propp/praxis/results.html#final
#  http://www.lrec-conf.org/proceedings/lrec2012/pdf/876_Paper.pdf
#########################################################################
#python nltk integration --- using Marti Hearst's textiling algorithm
# textiling uses a roving text window to identify breaks in the topical structure within a text
# http://people.ischool.berkeley.edu/~hearst/research/tiling.html
# http://clover.slavic.pitt.edu/sam/propp/praxis/results.html#final
# http://www.lrec-conf.org/proceedings/lrec2012/pdf/876_Paper.pdf
#########################################################################
# TO DO: 
#       * split apart sentences
#       * useopenNLP to identify named entities
#       * create 'the AutoPropp engine' 
########################################################################
########################################################################
########################################################################
########################################################################
########################################################################
#
# O, the wretchedness: the elegance of Python meets, well, R
#
########################################################################
library(rPython)
library(tm)
library(RTextTools)
########################################################################
python.exec("import nltk")
python.exec("import nltk.corpus")
python.exec("from nltk.corpus import PlaintextCorpusReader")
python.exec("from urllib import urlopen")
python.exec("import numpy")
########################################################################
# deprecated junk
########################################################################
python.exec("corpus_root = '/home/hinckley/Public/corpora/transcripts/1936'")
python.exec("corpus = PlaintextCorpusReader(corpus_root, '.*')")
python.get("corpus.fileids()")
python.get("corpus.open('fomcropa19361120.txt')")
#python.exec("url = \"/home/hinckley/Public/corpora/transcripts/1936/fomcropa19361120.txt\"")
#python.exec("url = \"/home/hinckley/Public/corpora/afan/ArmlessMaiden.txt\"")
#python.exec("url = \"/home/hinckley/Public/corpora/afan/BaldakBorisevich.txt\"")
#python.exec("url = \"/home/hinckley/Public/corpora/afan/JackFrost.txt\"")
#python.exec("url = \"/home/hinckley/Public/corpora/afan/DaughterStepdaughter.txt\"")
#python.exec("url = \"/home/hinckley/Public/corpora/afan/Berenushka.txt\"")
#########
## preprocess text
#########
wd = "/home/hinckley/Public/corpora/afan"
wd = "/home/hinckley/Public/corpora/coulter"
setwd(wd)
text <- system.file("texts", "txt", package="tm")
corpus <- Corpus(DirSource('.'))
corpus <- tm_map(corpus, function(x) iconv(enc2utf8(x), sub = "byte"))
corpus <- tm_map(corpus, removeWords, stopwords("SMART"))
corpus <- tm_map(corpus, removeWords, c(stopwords("english"))) 
#corpus <- tm_map(corpus, removePunctuation)
#corpus <- tm_map(corpus, removeNumbers)
#corpus <- tm_map(corpus, tolower)
corpus <- tm_map(corpus, stripWhitespace)
########################
# write corpus to local folder
########################
tm::writeCorpus(x=corpus, path="/home/hinckley/Public/doom")
python.exec("url = \"/home/hinckley/Public/doom/coulter17.txt.txt\"")
python.exec("url = \"/home/hinckley/Public/doom/mm17.txt.txt\"")
python.exec("raw = urlopen(url).read()")
#python.exec("alice = nltk.corpus.gutenberg.raw('carroll-alice.txt')")
#python.get("alice")
#python.exec("ttt = nltk.tokenize.TextTilingTokenizer(w=7, k=4, 
#similarity_method=0, stopwords=None, smoothing_method=[0], smoothing_width=2,
#smoothing_rounds=50, cutoff_policy=10, demo_mode=False)")
python.exec("ttt = nltk.tokenize.TextTilingTokenizer(w=7, k=3, smoothing_width = 6, smoothing_rounds = 10)")
#similarity_method, 0, BLOCK_COMPARISON,
python.get("raw")
python.exec(paste("tiles = ttt.tokenize(raw)"))
zip <- python.get("tiles[-2]")
zip
python.get("tiles")
writeLines(zip, "/home/hinckley/Public/monkey2.txt") #save text locally
#text <- paste("espeak -p 79 -k20 -v+f2 \"", zip, "\"", sep="")
########################
# creepy "whisper" voice
########################
text <- paste("espeak -v+whisper -k20 -p 79 -s 225 -f \"", "/home/hinckley/Public/monkey2.txt", "\"", sep="")
# http://espeak.sourceforge.net/commands.html
system(text)
#python.exec("nltk.tokenize.texttiling.demo(text=None)")
