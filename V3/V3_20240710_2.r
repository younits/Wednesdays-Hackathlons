n <- 1e3
a <- rnorm(n, 0, 10)
b <- runif(n, 0, 1)
plot(NULL, xlim = c(130, 170), ylim = c(50, 90), xlab = "height (cm)", ylab = "weight (kg)")
for (j in 1:50) abline(a = a[j], b = b[j], lwd = 2, col = 2)