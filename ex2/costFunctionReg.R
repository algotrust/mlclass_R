cost_reg <- function(theta, X, y, lambda) {
  m <- nrow(X)
  X <- as.matrix(X)
  J <- sum(-y * log(sigmoid(X %*% theta)) - (1-y) * log(1 - sigmoid(X %*% theta)))/m +
       sum(theta[2:length(theta)]^2) * lambda/(2*m);
  return(J)
}