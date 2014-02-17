##############################################################
# Formal, simplified representation of Proppian functions
# move by move from Appendix III (Schemes and Commentary)
#  - pg. 135 - 143 of Laurence Scott trans. 1968
# of V. J. Propp's Morphology of the Fairy Tale
# Morfologija Skazki (1928)
#
# http://cran.r-project.org/web/packages/HMM/HMM.pdf
#
# Licensed under GPL3 by Scott Alexander Malec (MalecLabs.com)
#  for more information, see: 
#  http://www.gnu.org/licenses/gpl-3.0.txt
###############################################################
#
# TO DO: initialize HMM
#
# hint:
# http://www.r-bloggers.com/fun-with-r-and-hmms/
#
#
#######################
library(HMM)
library(lattice)
library(RHmm)
afan <- c("A", "B", "C", "depart", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "o", "MOVE", "Pr", "Rs", "Q", "T", "U", "W", "X", "Ex", "return")
fake <- sample(c("A", "B", "C", "depart", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "o", "MOVE", "Pr", "Rs", "Q", "T", "U", "W", "X", "Ex", "return"))
a <- sample(c("A", "B", "depart", "D", "E", "F", "MOVE"))
b <- sample(c("A", "depart", "Pr", "Rs", "H", "W"))
c <- sample(c("A", "B", "D", "E", "F", "MOVE"))
d <- sample(c("A", "depart", "Pr", "Rs", "H", "I", "W"))
e <- sample(c("A", "B", "D", "E", "F", "return", "MOVE"))
f <- sample(c("A", "B", "C", "depart", "D", "E", "F", "return"))
g <- sample(c("A", "B", "C", "depart", "D", "E", "F", "D", "E", "F", "return", "MOVE"))
h <- sample(c("A", "B", "depart", "D", "E", "F", "D", "E", "F", "return"))
i <- sample(c("A", "D", "E", "F", "M", "N", "W"))
j <- sample(c("A", "B", "C", "depart", "G", "o", "L", "M", "N", "K", "Ex", "U", "W"))
k <- sample(c("A", "B", "C", "depart", "D", "E", "F", "return", "U", "MOVE"))
l <- sample(c("A", "C", "depart", "D", "E", "F", "D", "E", "F", "M", "N", "W"))
m <- sample(c("A", "B", "C", "depart", "K", "return", "MOVE"))
n <- sample(c("A", "B", "C", "depart", "K", "return", "MOVE"))
o <- sample(c("D", "E", "F", "A", "C", "depart", "D", "E", "F", "Pr", "Rs"))
p <- sample(c("A", "B", "C", "depart", "F", "K", "return", "MOVE"))
q <- sample(c("A", "B", "C", "depart", "F", "K", "return", "MOVE"))
r <- sample(c("A", "B", "depart", "D", "E", "return"))
s <- sample(c("A", "depart", "D", "E", "return", "Pr", "Rs", "L", "Q", "Ex", "T", "U", "W", "X"))
t <- sample(c("A", "B", "C", "depart", "D", "E", "F", "D", "E", "F", "G", "K", "return"))
u <- sample(c("A", "depart", "D", "E", "F", "D", "E", "F", "return", "Pr", "Rs", "Q", "W"))
v <- sample(c("A", "depart", "E", "F", "Rs", "K", "MOVE"))
w <- sample(c("A", "B", "C", "depart", "D", "E", "F", "I"))
x <- sample(c("D", "E", "F", "A", "depart", "o", "MOVE"))
y <- sample(c("F", "A", "C", "depart", "H", "J", "I", "K", "return", "Pr", "Rs", "L", "Q", "Ex", "U", "W"))
z <- sample(c("A", "B", "C", "depart", "K", "return", "MOVE"))
aa <- sample(c("D", "E", "F", "A", "B", "C", "F", "H", "J", "I", "K", "return", "Q", "T", "W", "X"))
ba <- sample(c("A", "o", "F", "o", "H", "J", "I", "K", "Pr", "Rs", "Q", "Ex", "T", "W"))
ca <- sample(c("A", "B", "C", "depart", "D", "E", "F", "G", "W", "MOVE"))
da <- sample(c("A", "C", "depart", "F", "G", "H", "K", "W"))
ea <- sample(c("A", "C", "depart", "H", "I", "K", "return", "W"))
fa <- sample(c("A", "B", "C", "depart", "K", "return", "MOVE"))
ga <- sample(c("A", "C", "depart", "D", "E", "F", "G", "F", "G", "I", "return", "MOVE"))
ha <- sample(c("A", "C", "depart", "D", "E", "F", "G", "o", "L", "M", "N", "K", "Q", "Ex", "U", "W"))
ia <- sample(c("A", "C", "depart", "D", "E", "F", "MOVE"))
ja <- sample(c("B", "C", "depart", "D", "E", "F", "H", "I", "K", "return"))
ka <- sample(c("A", "C", "F", "H", "I", "K", "return", "Pr", "Rs"))
la <- sample(c("A", "B", "C", "D", "E", "K", "MOVE"))
ma <- sample(c("A", "B", "C", "K", "MOVE"))
na <- sample(c("A", "C", "H", "I", "K", "return", "Pr", "Rs"))
oa <- sample(c("D", "E", "F", "A", "C", "H", "I", "return", "Pr", "Rs", "MOVE"))
pa <- sample(c("A", "B", "C", "depart", "F", "F", "M", "N", "K", "return"))
qa <- sample(c("A", "B", "C", "depart", "D", "E", "F", "G", "H", "I", "K", "return", "Pr", "Rs", "MOVE"))
ra <- sample(c("A", "C", "depart", "D", "E", "F", "G", "K", "return", "W", "MOVE"))
sa <- sample(c("A", "B", "C", "depart", "M", "N", "K", "return"))
ta <- sample(c("D", "E", "F", "A", "B", "C", "depart", "H", "I", "K", "W", "X", "MOVE"))
ua <- sample(c("A", "C", "depart", "D", "E", "F", "G", "o", "L", "M", "N", "Q", "T", "U", "W", "X"))
va <- sample(c("A", "B", "C", "depart", "D", "E", "G", "F", "I", "K", "return", "W"))
wa <- sample(c("A", "B", "C", "depart", "F", "D", "E", "F", "G", "I", "K", "return", "MOVE"))
xa <- sample(c("A", "C", "depart", "F", "G", "K", "U", "W"))
ya <- sample(c("A", "C", "depart", "F", "H", "I", "K", "return", "MOVE"))
za <- sample(c("A", "depart", "F", "H", "I", "K", "return", "W"))
ab <- sample(c("A", "B", "C", "depart", "F", "G", "M", "N", "T", "W"))
bb <- sample(c("A", "B", "C", "depart", "F", "G", "K", "return"))
cb <- sample(c("A", "B", "C", "depart", "H", "I", "K", "return"))
db <- sample(c("A", "B", "C", "depart", "H", "I", "K", "W"))
eb <- sample(c("D", "E", "A", "B", "C", "depart", "K", "return", "MOVE"))
fb <- sample(c("A", "B", "C", "depart", "H", "I", "K", "return", "Pr", "Rs", "U", "W"))
gb <- sample(c("A", "B", "C", "depart", "H", "I", "K"))
hb <- sample(c("A", "depart", "H", "I", "K", "return"))
ib <- sample(c("A", "C", "depart", "F", "H", "I", "W", "U"))
jb <- sample(c("D", "E", "F", "A", "C", "depart", "F", "H", "I", "K", "W"))
kb <- sample(c("A", "B", "C", "depart", "D", "E", "F", "K", "return", "MOVE"))
lb <- sample(c("A", "B", "C", "depart", "D", "E", "F", "K", "return", "MOVE"))
mb <- sample(c("A", "B", "C", "depart", "G", "I", "K", "U", "MOVE"))
nb <- sample(c("A", "B", "C", "depart", "H", "J", "I", "K", "L", "Q", "Ex", "U", "W", "X"))
ob <- sample(c("A", "B", "C", "depart", "D", "E", "F", "G", "D", "E", "F", "G", "o", "L"))
pb <- sample(c("A", "C", "depart", "K", "MOVE"))
qb <- sample(c("A", "C", "depart", "F", "K", "return", "Pr", "Rs", "MOVE"))
rb <- sample(c("A", "B", "C", "depart", "K", "return", "Pr", "Rs", "MOVE"))
sb <- sample(c("A", "depart", "F", "D", "E", "F", "o", "L", "Pr", "Rs"))
tb <- sample(c("A", "B", "C", "depart", "H", "I", "K", "return", "MOVE"))
ub <- sample(c("A", "depart", "F", "G", "H", "I", "K", "MOVE", "K"))
vb <- sample(c("A", "depart", "D", "E", "F", "G", "D", "E", "F", "G", "J", "I", "K", "return", "MOVE"))
wb <- sample(c("A", "depart", "G", "H", "I"))
xb <- sample(c("D", "E", "F", "A", "H", "I", "K", "W", "X", "MOVE"))
yb <- sample(c("A", "B", "C", "depart", "H", "I", "K", "W", "X"))
zb <- sample(c("A", "B", "C", "depart", "G", "I", "T", "W", "return"))
ac <- sample(c("A", "C", "depart", "G", "K", "return", "W", "return", "MOVE"))
bc <- sample(c("A", "C", "depart", "F", "G", "I", "W", "return"))
cc <- sample(c("D", "E", "F", "A", "depart", "G", "W", "MOVE"))
dc <- sample(c("A", "G", "T", "Q"))
ec <- sample(c("A", "D", "E", "F", "K", "T", "U", "W", "MOVE"))
fc <- sample(c("A", "B", "C", "G", "MOVE"))
gc <- sample(c("A", "B", "C", "G", "MOVE"))
hc <- sample(c("A", "B", "C",  "depart", "D", "E", "F", "M", "N", "W", "return"))
obs <- c(fake, a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, 
         w, x, y, z, aa, ba, ca, ca, da, ea, fa, ga, ha, ia, ja, ka, la, ma, na, 
         oa, pa, qa, ra, sa, ta, ua, va, wa, xa, ya, za, ab, cb, db, eb, fb, gb, 
         hb, ib, jb, kb, lb, mb, nb, ob, pb, qb, rb, sb, tb, ub, vb, wb, xb, yb, 
         zb, ac, bc, cc, dc, ec, fc, gc, hc)
#obs <- c(fake, fake, fake, fake, fake, fake, fake, fake, fake, fake, a, b, c)
prob <- function (x) {x / sum (x)}  # Makes it a probability (it sums to 1)
hmm <- initHMM(afan, afan, startProbs=(prob (runif (2))),
					transProbs=apply (matrix (runif (4), 2), 1, prob),
					emissionProbs=apply (matrix (runif (52), 2), 1, prob))
system.time (obs.vt <- viterbiTraining(hmm, obs, delta=1E-9, maxIterations=100, pseudoCount = 1))
xyplot(obs.vt$hmm$emissionProbs[1,] ~ c(1:26), scales=list(x=list(at=1:26, labels=colnames(obs.vt$hmm$emissionProbs))), type="h")
xyplot(obs.vt$hmm$emissionProbs[2,] ~ c(1:26), scales=list(x=list(at=1:26, labels=colnames(obs.vt$hmm$emissionProbs))), type="h")
#system.time (obs.bw <- baumWelch(hmm, obs))
#xyplot (obs.bw$hmm$emissionProbs[1,] ~ c(1:26), scales=list(x=list(at=1:26, labels=colnames (obs.bw$hmm$emissionProbs))), type=”h”)
#xyplot (obs.bw$hmm$emissionProbs[2,] ~ c(1:26), scales=list(x=list(at=1:26, labels=colnames (obs.bw$hmm$emissionProbs))), type=”h”)
####################
####################
####################
####################
hmm <- initHMM(afan, afan) #, startProbs = sp)
#posteriorProbabilities <- posterior(hmm, obs);
#logForwardProbabilities <- forward(hmm, obs);
#logBackwardProbabilities <- backward(hmm, obs);
#print(exp(logBackwardProbabilities));
baumWelch(hmm, obs)
#viterbi(hmm, obs)
vt <- viterbiTraining(hmm, obs, maxIterations = 200000, pseudoCount = 1, delta = 1E-6)
vt$hmm$transProbs
hmm <- initHMM(afan, afan, transProbs = vt$hmm$transProbs, emissionProbs=vt$hmm$emissionProbs)
simMarkov = function(hmm, length)
{
  # hmm$transProbs[is.na(hmm$transProbs)]       = 0
  # hmm$emissionProbs[is.na(hmm$emissionProbs)] = 0
  states   = c()
  emission = c()
  states   = c(states, sample(hmm$States,1,prob=hmm$startProbs))
  for(i in 2:length)
  {
    state  = sample(hmm$States, 1, prob=hmm$transProbs[states[i-1],])
  	states = c(states, state)
  }
  for(i in 1:length)
  {
    emi      = sample(hmm$Symbols, 1, prob=hmm$emissionProbs[states[i],])
  	emission = c(emission, emi)
  }
  return(list(states=states,observation=emission))
}
simMarkov(hmm, 5)
simHMM(hmm, 5)
# NEXT: experiment with training parameters
#
#
#
#
###############################################
###############################################
