source('computeCost.R')
gradientDescent <- function(X, y, theta, alpha, num_iters){
  m <- length(y)
  X <- as.matrix(X)
  J_hist <- rep(num_iters,0)
  for (i in num_iters){
    theta <- theta - alpha * t(X) %*% (X %*% initial_theta - y) / m
    print( computeCost(X,y,theta) )
  }
  return(list('theta' = theta,'J_hist'=J_hist))
}