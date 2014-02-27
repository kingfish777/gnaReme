gnaReme
=======

naReme is a tool in R statistical language for identifying Proppian functions / narremes (explicit linguistic marking of story 'state') in Russian fairy tales from corpus of annotates fairy tales marked up according to the PftML DTD. For more information: 
* http://clover.slavic.pitt.edu/sam/propp/theory/propp.html
* http://dh2010.cch.kcl.ac.uk/academic-programme/abstracts/papers/html/ab-753.html
* http://ilk.uvt.nl/amicus/WS01/scott_malec_ea.pdf


Goods: 
 * pftml.dtd
 * rPython_NLTK.R R interface to access Python/NLTK's implementation of Marti Hearst's Textiling algorithm, auto-segmentation of texts using roving windows and cosine similarity metrics to identify topical cleavages/breaks, i.e. paragraphs or narrames: http://people.ischool.berkeley.edu/~hearst/research/tiling.html
 * Magic_Swan_Geese.xml - sample of marked up tale in English
 

TO DO:
 * finish HMM.R representation of narremes
 * chunk using NLTK_TextTiling.R
 * distance matrix using weights from HMM and cosine similarity of text segments marked up as containing the same narrative function
 


HMM tutorial: http://www.r-bloggers.com/fun-with-r-and-hmms/

--------------
last edited 2/27/2014 SAM


http://www.feb-web.ru/feb/skazki/texts/af0/af1/af1-120-.htm
