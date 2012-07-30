gradient <- function(theta, X, y){
  n <- ncol(X)
  X <- as.matrix(X)
  grad <- rep(0,n)
  return(grad)
}

cost <- function(theta, X, y) {
  m <- nrow(X)
  X <- as.matrix(X)
  J <- 0;
  return(J)
}