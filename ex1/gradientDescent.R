gradientDescent <- function(X, y, theta, alpha, num_iters){
  m <- length(y)
  X <- as.matrix(X)
  J_hist <- 0
  return(list('theta' = theta,'J_hist'=J_hist))
}