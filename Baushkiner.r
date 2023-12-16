# first
set.seed(999)

x1 <- rnorm(1000, mean = 2, sd = 1)
x2 <- rbinom(1000, size = 1, prob = 0.75)
e <- rnorm(1000, 0, 5)
y <- 0.8 + 1.5 * x1 + 2.1 * x2 + e

df <- data.frame(y, x1, x2)

model <- lm(y ~ x1 + x2, data=df)
summary(model)

ols_estimate <- function(data, dependent_var, independent_vars) {
  y <- as.matrix(data[, dependent_var])
  X <- data[, independent_vars]
  X <- as.matrix(cbind(1, X))
  beta_hat <- solve(t(X) %*% X) %*% t(X) %*% y
  return(beta_hat)
}

data <- data.frame(x1 = x1, x2 = x2, y = y)
estimated_coeffs <- ols_estimate(data, "y", c("x1", "x2"))
print(estimated_coeffs)
# result the same as using lm() because calculation is the same

# second
library(readxl)
library(stats)

data <- read_excel("/kaggle/input/sample/sample.xlsx")
log_likelihood <- function(params) {
  mu1 <- params[1]
  mu2 <- params[2]
  
  alpha <- 0.75
  sigma1 <- 1
  sigma2 <- 3
  
  n <- length(data$sample)
  
  prob1 <- alpha * dnorm(data$sample, mean = mu1, sd = sigma1)
  prob2 <- (1 - alpha) * dnorm(data$sample, mean = mu2, sd = sigma2)
  
  log_likelihood <- sum(log(prob1 + prob2))
  
  return(-log_likelihood)
}
starting_values <- c(mu1 = 1, mu2 = 2)
result <- optim(starting_values, log_likelihood)
print(result$par)
log_likelihood <- function(params) {
  mu1 <- params[1]
  sigma1 <- params[2]
  mu2 <- params[3]
  sigma2 <- params[4]
  alpha <- params[5]
  
  if (sigma1 <= 0 | sigma2 <= 0 | alpha < 0 | alpha > 1) {
    return(Inf)
      }
  
  n <- length(data$sample)
  
  prob1 <- alpha * dnorm(data$sample, mean = mu1, sd = sigma1)
  prob2 <- (1 - alpha) * dnorm(data$sample, mean = mu2, sd = sigma2)
  
  log_likelihood <- sum(log(prob1 + prob2))
  
  return(-log_likelihood)  # negative to minimize
}
starting_values <- c(mu1 = 1, sigma1 = 1, mu2 = 2, sigma2 = 3, alpha = 0.75)
result <- optim(starting_values, log_likelihood)
print(result$par)
