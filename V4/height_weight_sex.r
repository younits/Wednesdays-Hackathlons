# install.packages(c("coda", "mvtnorm", "devtools", "dagitty"))
# install.packages("Rlab")
library(devtools)
library(Rlab)
# devtools::install_github("rmcelreath/rethinking")

# S <- sample(c(1,2), 20, replace = TRUE)

# S=1 female; S=2 male
sim_HW <- function(S, b, a) { # nolint
  N <- length(S)
  H <- ifelse(S == 1, 150, 160) + rnorm(N, 0, 5)
  W <- a[S] + b[S] * H + rnorm(N, 0, 5)
  # for each S/Sex, there is a different height-weight line
  data.frame(S, H, W)
}

S <- rbern(100, 1) + 1       #rbern = 100 individuals; drawn male or female at random 
dat <- sim_HW(S, b = c(0.5, 0.6), a = c(0,0))   # simulates HW
head(dat)
