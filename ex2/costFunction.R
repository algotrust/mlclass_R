costFun <- function(theta, X, y){
  J <- 0
  n <- length(theta)
  grad <- rep(0, n)
  list(cost = J, gradient = grad)
}