#!/usr/bin/Rscript 
library(ggplot2)
library(reshape)
#Closing all the plots and resetting all the variables in the workspace
graphics.off()
rm(list = ls())

source("sigmoid.R")
source("costFunctionReg.R")
source("predict.R")
source('mapFeature.R')

#Reading excercise data
data <- read.delim("ex2data2.txt", header=FALSE, sep=",")
data$V3 <- factor(data$V3)

#=======Part 1. Plotting exam scores and admissions==============
p <- ggplot(data, aes(x = V1, y = V2, color = V3, shape = V3)) +
  geom_point() +
  scale_x_continuous("Microchip test 1") +
  scale_y_continuous("Microchip test 2") +
  scale_colour_hue(name = "QC pass", labels=c("No", "Yes")) +
  scale_shape(name = "QC pass", labels=c("No", "Yes"))   
print(p)
#Pausing execution
cat("Program paused. Press enter to continue...")
readline()
#======= Part2 Finding optimal params ====

#Initializing input variables X and output variables y
X <- mapFeature(data[,c(1)],data[,c(2)])
y <- as.numeric(data[,3]) - 1

m <- nrow(X)  
n <- ncol(X)
initial_theta <- rep(0,n)

# Setting upregularization parameter
lambda <- 1

#===== Finding optimal parameters with optim function =====
# Finding optimal parameters with optim function.
# Tip from stackoverflow: http://stackoverflow.com/q/11546036/218584
# More info: ?optim
o <- optim(initial_theta, cost_reg,X=X, y=y,lambda=lambda)
opt_params <- unlist(o["par"])
# Printing values
cat(sprintf('Cost at theta found by optim: %f\n\n', o["value"]))
#=====Plotting decision boundary ========
# Code taken from here:
# http://ygc.name/2011/10/26/machine-learning-5-2-regularized-logistic-regression/

#Initializing argument vectors with arbitrary value
u <- seq(min(data[1]),max(data[1]), len=200)
v <- seq(min(data[2]),max(data[2]), len=200)
#Initializing empty matrix 
z0 <- matrix(0, length(u), length(v))
#Filling matrix values: i-jth value there equals
# value of the regression function we found 
# with values u(i) and v(j)
for (i in 1:length(u)) {
  for (j in 1:length(v)) {
    features <- mapFeature(u[i],v[j])
    z0[i,j] <- as.matrix(features) %*% opt_params
  }
}
# Naming rows and colums of our matrix
# And preparing it for plotting
rownames(z0) <- as.character(u)
colnames(z0) <- as.character(v)
z0.melted <- melt(z0)
z0.melted <- data.frame(z0.melted, lambda=lambda)
zz <- rbind(z0.melted)
#Lambda is a factor argument:
# We don't want it to be on x or y axis
zz$lambda <- factor(zz$lambda)
colnames(zz) <- c("u", "v", "z", "lambda")
# using geom_countour method from ggplot2 package
# note: we reinitialized colour and shape variables in aes
# because we assigned different vectors to these variables 
# when we drew p the first time
p <- p+geom_contour(data=zz, aes(x=u, y=v, z=z, group=lambda, colour=lambda,shape=lambda),bins=1)
print(p)
 #==== Prediction and accuracies =========
# Calculating accuracy of our algorithm on training set
p <- predict(opt_params, X) == y
acc <- length(p[p==TRUE])/length(p)
cat(sprintf('Train accuracy: %f\n',acc))