#######################################################################
#EXPERIMENT III
# texttiling snippets of Russian magic tales (textTiling divides texts into "paragraphs"/topical parts)
#
#results would like something like this ===>
#
# each "raw" fairy tale resulting text tiles will be compared with language models of various functions:
#TEXT 1
#snippetLM         i     ii      iii     iv        v      vi     vii     vii     ix     x     xi      xii
#initSituationLM .5  .001 .0002  .0003 .003 .05    .09   .0394  .01 .014 .1  .001
#VillainyLM       .003 .8   .001   .02    .08   etc.
#LackLM           .03   .3   .08 etc.
#CardinalLM (combination of Villainy and Lack)
#DonorFunctionLM
#HeroReactionLM
#AcquisitionOfMagicalAgentLM
#DonorClusterLM(combination of last three)
#ReturnLM
#TransfigurationLM
#WeddingLM
#EpilogueLM
#
#TEXT 2
#snippet   i
#etc.
#
# PURPOSE: demonstrate how model can be used to determine the structure
#                   of 'raw' magic tale narratives
#
######################################################################
