gnaReme
=======

gnaReme is suite of tools for the purpose of automatically identifying recurrent content objects in natural langauge narratives at a level above the sentence. Inspired by the original work of Vladimir J. Propp, the objective is to develop a class of algorithms that would identifying verbal constructs that would look something like Proppian functions / narremes (explicit linguistic marking of story 'state'). For the purpose of creating a training corpus for non-parametric statistical learning, a corpus of Russian magic tales had been annotated and marked up according to the PftML DTD (Malec 2001). 

For more information: 
* http://clover.slavic.pitt.edu/sam/propp/theory/propp.html
* http://dh2010.cch.kcl.ac.uk/academic-programme/abstracts/papers/html/ab-753.html
* http://ilk.uvt.nl/amicus/WS01/scott_malec_ea.pdf


Goods: 
 * pftml.dtd
 * rPython_NLTK.R R interface to access Python/NLTK's implementation of Marti Hearst's Textiling algorithm, auto-segmentation of texts using roving windows and cosine similarity metrics to identify topical cleavages/breaks, i.e. paragraphs or narrames: http://people.ischool.berkeley.edu/~hearst/research/tiling.html
 * Magic_Swan_Geese.xml - sample of marked up tale in English
 

TO DO:
 * finish markov model representation of narremes in HMM.R
 * chunk using NLTK_TextTiling.R
 * implement more of AutoPropp in R
 * distance matrix using weights from HMM and cosine similarity of text segments marked up as containing the same narrative function
 
HMM tutorial: http://www.r-bloggers.com/fun-with-r-and-hmms/

--------------
last edited 2/27/2014 SAM


http://www.feb-web.ru/feb/skazki/texts/af0/af1/af1-120-.htm
