###################################################################
#EXPERIMENT I
# random snippets
#      ... DNA
#      ... java code
#      ... bureaucratic/legal  language
#      ... Russian magic tales
#
# PURPOSE: demonstrate concepts like perplexity, entropy, ground work in
#               classic information theory (Claude Shannon)
#
###################################################################

pftmlObjects <- c(dtm.villainy, dtm.lack, dtm.cardinal, etc.) 

testObjects  <- createTestObjects(DNA, java, legalese, afanasiev) 

for (counter in 1:testObjects) {

  for (index in 1:pftmlObjects) {

         getScore(pftmlObjects[index], testObjects[counter])

  }
}


# useful stuff
# system('cp * Lack Experiment')
# sqldf 
# data.table
# random
# set.seed





