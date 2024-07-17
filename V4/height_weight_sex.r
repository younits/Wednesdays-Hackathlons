# S=1 female; S=2 male
sim_HW <- function(S, b, a) { # nolint
  N <- length(S)
  H <- ifelse(S == 1, 150, 160) + rnorm(N, 0, 5)
  W <- a[S] + b[S] * H + rnorm(N, 0, 5)
  # for each S/Sex, there is a different height-weight line
  data.frame(S, H, W)
}