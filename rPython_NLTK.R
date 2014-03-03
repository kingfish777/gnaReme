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
# Date: 1/23/2014
#
# TITLE: rPython_NLTK.R
#
# Purpose: R Tools to interface with Python NLTK's implementation of Marti Heart's
# TextTiling algorithm
#
#########################################################################
#python nltk integration --- using Marti Hearst's textiling algorithm
# textiling uses a roving text window to identify breaks in the topical structure within a text
# http://people.ischool.berkeley.edu/~hearst/research/tiling.html
# http://clover.slavic.pitt.edu/sam/propp/praxis/results.html#final
# http://www.lrec-conf.org/proceedings/lrec2012/pdf/876_Paper.pdf
########################################################################
# TO DO: 
#       * introduce tm_map to clean up text of white space and other indicators
#       * split apart sentences
#       * useopenNLP to identify named entities
#      * create 'the AutoPropp engine'
#######################################################################
library(rPython)
python.exec("import nltk")
python.exec("import nltk.corpus")
python.exec("from nltk.corpus import PlaintextCorpusReader")
python.exec("from urllib import urlopen")
python.exec("import numpy")
python.exec("corpus_root = '/home/hinckley/Public/corpora/transcripts/1936'")
python.exec("corpus = PlaintextCorpusReader(corpus_root, '.*')")
python.get("corpus.fileids()")
python.get("corpus.open('fomcropa19361120.txt')")
#python.exec("url = \"/home/hinckley/Public/corpora/transcripts/1936/fomcropa19361120.txt\"")
python.exec("url = \"/home/hinckley/Public/corpora/afan/ArmlessMaiden.txt\"")
python.exec("url = \"/home/hinckley/Public/corpora/afan/BaldakBorisevich.txt\"")
#python.exec("url = \"/home/hinckley/Public/corpora/afan/JackFrost.txt\"")
python.exec("url = \"/home/hinckley/Public/corpora/afan/DaughterStepdaughter.txt\"")
python.exec("url = \"/home/hinckley/Public/corpora/afan/Berenushka.txt\"")
python.exec("url = \"/home/hinckley/Public/corpora/afan/KoshchejBesmertnyj.txt\"")
python.exec("url = \"/home/hinckley/Public/corpora/myron_magnet/mm49.txt\"")
python.exec("raw = urlopen(url).read()")
#python.exec("alice = nltk.corpus.gutenberg.raw('carroll-alice.txt')")
#python.get("alice")
#python.exec("ttt = nltk.tokenize.TextTilingTokenizer(w=7, k=4, similarity_method=0, stopwords=None, smoothing_method=[0], smoothing_width=2, smoothing_rounds=50, cutoff_policy=10, demo_mode=False)")
python.exec("ttt = nltk.tokenize.TextTilingTokenizer(w=7, k=3, smoothing_width = 6, smoothing_rounds = 10)")
#similarity_method, 0, BLOCK_COMPARISON,
python.get("raw")
python.exec(paste("tiles = ttt.tokenize(raw)"))
zip <- python.get("tiles[-1]")
zip
python.get("tiles")
text <- paste("espeak -p 79 -k20 -v+f2 \"", zip, "\"", sep="")
# http://espeak.sourceforge.net/commands.html
text
system(text)
#python.exec("nltk.tokenize.texttiling.demo(text=None)")
