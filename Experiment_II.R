##################################################################
# EXPERIMENT II
# functions where they don't belong
#  -> villainy with return, acquisition of magical agent with wedding, liquidation of lack with lack
#  -> randomized samples vs. 'held out' data from markup
#
#  what results will look like:
#
#             VillainySample1 VillainySample2 VillainySample3 etc.
# VillainyLM     .8         
# LackLM         .3
# ...
# WeddingLM   0
# EpilogueLM   0
#
#  ... do the same with held out LackSamples ... WeddingSamples, EpilogueSamples         
#
# PURPOSE: show how language model from PftML can be useful even
#               even if it is imperfect, rough-hewn
#
##################################################################


pftmlObjects <- c(dtm.villainy, dtm.lack, dtm.cardinal, etc.) 


for (counter in 1:pftmlObjects) {

  for (index in 1:pftmlObjects) {

         getScore(pftmlObjects[index], pftmlObjects[counter])
         # insert score in sqllite3 db using sqldf
         # print out results
  }
}



# useful stuff
# system('cp * Lack Experiment')
# sqldf 
# data.table
# random
# set.seed
