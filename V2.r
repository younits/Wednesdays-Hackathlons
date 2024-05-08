# intial comment


#########################################################################################

# GLOBE EXAMPLE

# function to toss a globe covered p by water N times
sim_globe <- function(p=0.7 , N=9)  {
    sample (c("W", "L"), size = N, prob=c(p, 1 - p), replace = TRUE)
}

sim_globe(p=0.2, N=6)


# function to compute posterior distribution

##compute_posterior <- function (the_sample , poss = c(0,0.25, 0.5,0.75,1) ) {
##    W <- sum(the_sample=="W") # number of W observed
##    L <- sum(the_sample=="L") # number of L observed 
##    ways <- sapply(poss, function (q) (q*4)^W * ((1-q)*4)^L)
##    post <- ways/sum(ways)
##    data.frame(poss, ways, post=round(post,3))
##}

##compute_posterior(sim_globe())

########################################################################################

# Sampling the posterior predictive distribution (1:11 h in Video 2)

post_samples <- rbeta(1e3,6+1,3+1)

pred_post <- sapply(post_samples, function(p) sum(sim_globe(p,10)=="W"))
tab_post <- table(pred_post)
for(i in 0:10) lines(c(i,i),c(0,tab_post[i+1],lwd=4,col=4))