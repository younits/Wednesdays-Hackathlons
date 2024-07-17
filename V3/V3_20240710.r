# a continous aproximation does not need a grid
# quardratic approximation = we aproximate the posterior distribution as a multivariant (gaussian) distribution
# quap is the tool for quardratic approximation


m3.1 <- quap(
    alist(
       W ~ dnorm(mu, sigma),
       mu <- a + b * H,
       a ~ dnorm(0, 10)
       b ~ dunif(0, 1),
       sigma ~ dunif(0, 10)
), data=list(W=W,H=J))
