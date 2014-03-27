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

library(sqldf)
library(data.table)

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


sample sqldf:

library(sqldf)
library(data.table)
t_twelve <- dput(t12ts)
#t12 <- as.data.table(t12ts)
t12 <- as.data.table(cbind(tx, tdt))
t12
tbill_data <- as.data.table(cbind(tbill_x, tbill_dt))
tbill_data

# do not run this - this is a cartesian join - it will hang your machine
#sqldf("
# SELECT *
# FROM t12 as t12, tbill_data as b, t12 as t12_plus1
# ")

#print the current and the day before the next Fed statement
sqldf("SELECT t12_1.tdt, t12_2.tdt-1
FROM t12 as t12_1,
t12 as t12_2
WHERE t12_2.tdt > t12_1.tdt
AND t12_2.tdt = (SELECT MIN(t12_3.tdt) AS tdt
FROM t12 as t12_3
WHERE t12_3.tdt > t12_1.tdt)")


#dot product calculation example:

library("lsa")
# load training texts
training_matrix = textmatrix("/home/kingfish/proppian_function_language_models/Villainy")
# calculate tfidf
training_matrix = lw_bintf(training_matrix) * gw_idf(training_matrix) #weighting
lsa_space = lsa(training_matrix) # create LSA space
# fold-in test and gold standard snippets
test_gold_matrix = textmatrix("/home/kingfish/proppian_function_language_models/Lack", vocabulary=rownames(trm))
#tem = tem[tem == NULL] <- 0 # set NULLs to zeroes
test_gold_matrix = lw_bintf(test_gold_matrix) * gw_idf(test_gold_matrix) #weighting
test_gold_matrix_space = fold_in(test_gold_matrix, lsa_space)
# score snippet against gold standard
# remove subscripts for comparison matrix of all texts
cor(test_gold_matrix_space[,"Villainy4.txt"], test_gold_matrix_space[,"Return1.txt"]) 
#calculate mean correlation score of test snippet against training and gold snippets
mean(cor(test_gold_matrix_space, test_gold_matrix_space[,"Wedding2.txt"]))
