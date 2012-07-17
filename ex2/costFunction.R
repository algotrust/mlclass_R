costFun <- function(theta, X, y){
  X <- as.matrix(X)
  J <- sum(-y * log(sigmoid(X %*% theta)) - (1-y) * log(1 - sigmoid(X %*% theta)))/m;
  grad <- t(X %*% theta - y) %*% X/m
# Returning a list object. More info about lists in R:
# http://stackoverflow.com/q/2050790/218584  
  list(cost = J, gradient = grad)
}