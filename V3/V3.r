# function to simulate weights of individuals from height
# sd = standard deviation = U
# rnorm = a randowm normal;
    # which we simulate one for each individual  # nolint
    # in the vector H/ the length of H; wiht a mean of 0
    # and some standard deviation

sim_weight <- function(H, b, sd) {
  U <- rnorm(length(H), 0, sd)
  W <- b*H + U
  return(W)
}


H <- runif(2000, min = 130, max = 170)                               # 200 random individuals, with heights within 130 and 170 # nolint
W <- sim_weight(H, b = 0.5, sd = 5)
plot(W ~ H, col = 2, lwd = 3)