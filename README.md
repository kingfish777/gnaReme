#gnaReme
=======

gnaReme is suite of tools for the purpose of automatically identifying recurrent content objects in natural langauge narratives at a level above the sentence. Inspired by the original work of Vladimir J. Propp, the objective is to develop a class of algorithms that would identify verbal constructs that would look something like Proppian functions / narremes (explicit linguistic marking of story 'state'). For the purpose of creating a training corpus for non-parametric statistical learning, a corpus of Russian magic tales had been annotated and marked up according to the PftML DTD (Malec 2001). 

-------------------------------------------------------------------
#EXPERIMENT I
 random snippets
      * DNA
      * Fortran77 source code
      * bureaucratic/legal  language
      * Russian magic tales

## PURPOSE: demonstrate concepts like perplexity, entropy, ground work in
##               classic information theory (Claude Shannon)

-------------------------------------------------------------------
# EXPERIMENT II
 functions where they don't belong
      * villainy with return, acquisition of magical agent with wedding, liquidation of lack with lack
      * randomized samples vs. 'held out' data from markup

  what results will look like:

             VillainySample1 VillainySample2 VillainySample3 etc.
 VillainyLM     .8         
 LackLM         .3
 ...
 WeddingLM   0
 EpilogueLM   0

  ... do the same with held out LackSamples ... WeddingSamples, EpilogueSamples         

## PURPOSE: show how language model from PftML can be useful even
 ##              even if it is imperfect, rough-hewn

--------------------------------------------------------------------------
#EXPERIMENT III

 texttiling snippets of Russian magic tales (textTiling divides texts into "paragraphs"/topical parts)

results would like something like this ===>

 each "raw" fairy tale resulting text tiles will be compared with language models of various functions:
 
-------------- 
## TEXT 1
 
###snippetLM         i     ii      iii     iv        v      vi     vii     vii     ix     x     xi      xii

####initSituationLM .5  .001 .0002  .0003 .003 .05    .09   .0394  .01 .014 .1  .001

####VillainyLM       .003 .8   .001   .02    .08   etc.

####LackLM           .03   .3   .08 etc.

####CardinalLM (combination of Villainy and Lack)

####DonorFunctionLM

####HeroReactionLM

####AcquisitionOfMagicalAgentLM

####DonorClusterLM(combination of last three)

####ReturnLM

####TransfigurationLM

####WeddingLM

####EpilogueLM


---------------
## TEXT 2

###snippet   i

####etc.

## PURPOSE: demonstrate how model can be used to determine the structure
##                   of 'raw' magic tale narratives

-----------------------------------------------------------------------


For more information: 
* http://dh2010.cch.kcl.ac.uk/academic-programme/abstracts/papers/html/ab-753.html
* http://ilk.uvt.nl/amicus/WS01/scott_malec_ea.pdf
* https://github.com/kingfish777/ProppianFunction-vs-Tale_Matrix_Project
* https://github.com/kingfish777/gnaRemeCorpus
* https://github.com/kingfish777/central_corpora/tree/master/AFAN
* Raw material: http://www.feb-web.ru/feb/skazki/default.asp?/feb/skazki/texts/af0/af0.html


Goods: 
 * pftml.dtd
 * rPython_NLTK.R R interface to access Python/NLTK's implementation of Marti Hearst's Textiling algorithm, auto-segmentation of texts using roving windows and cosine similarity metrics to identify topical cleavages/breaks, i.e. paragraphs or narrames: http://people.ischool.berkeley.edu/~hearst/research/tiling.html
 * Magic_Swan_Geese.xml - sample of marked up tale in English
 

TO DO:
 * finish markov model representation of narremes in HMM.R
 * chunk using NLTK_TextTiling.R
 * implement more of AutoPropp in R
 * distance matrix using weights from HMM and cosine similarity of text segments marked up as containing the same narrative function
 * non-Guterman corpus from 1916, no, use copy & paste feb-web and use Google translate or Bing Trans, chunking text for bulk machine translation
 * edit Russian and English corpora (both marked up training set and non marked up test set
 * tokenize at sentence level
 * simplify combinatorics function (create simple workable example that can scale up to AutoPropp)
 
HMM tutorial: http://www.r-bloggers.com/fun-with-r-and-hmms/

--------------
last edited 3/24/2014 SAM


http://www.feb-web.ru/feb/skazki/texts/af0/af1/af1-120-.htm
