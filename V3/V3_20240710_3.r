# Linear regression: Validate model

# simulate a sample of 10 people

# set.seed(93) # is a random number generator
# H <- runif(10, 130, 170)
# W <- sim_weight(H, b = 0.5, sd = 5)

# # run model
# # Load the rethinking package
# library(rethinking)
# m3.1 <- quap(
#     alist(
#        W ~ dnorm(mu, sigma),
#        mu <- a + b * H,
#        a ~ dnorm(0, 10),
#        b ~ dunif(0, 1),
#        sigma ~ dunif(0, 10)
# ),data = list(W = W, H = H))

# # summary
# precis(m3.1)



# Analyse the data
dat <- list(W = d2$weight, H = d2$height)
m3.1 <- quap(
    alist(
       W ~ dnorm(mu, sigma),
       mu <- a + b * H,
       a ~ dnorm(0, 10),
       b ~ dunif(0, 1),
       sigma ~ dunif(0, 10)
),data = list(W = W, H = H))
precis(m3.2)
