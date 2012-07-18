#!/usr/bin/Rscript
library(ggplot2)
library(trust)
#Closing all the plots and resetting all the variables in the workspace
graphics.off()
rm(list = ls())

#Loading files filled in manually
source("sigmoid.R")
source("costFunction.R")
source("predict.R")

#Reading excercise data
data <- read.delim("ex2data1.txt", header=FALSE, sep=",")
data$V3 <- factor(data$V3)

#=======Part 1. Plotting exam scores and admissions==============
p <- ggplot(data, aes(x = V1, y = V2, color = V3, shape = V3)) +
   geom_point() +
   scale_x_continuous("Exam 1 score") +
   scale_y_continuous("Exam 2 score") +
   scale_colour_hue(name = "Admitted?", labels=c("No", "Yes")) +
   scale_shape(name = "Admitted?", labels=c("No", "Yes"))   
print(p)
#Pausing execution
cat("Program paused. Press enter to continue...")
readline()
#=========Part 2. Computing cost and gradient ==================
#Initializing input variables X and output variables y
X <- data[,c(1,2)]
y <- as.numeric(data[,3]) - 1

m <- nrow(X)  
n <- ncol(X)

#Adding intercept term and initializing parameters
X$V0 <- rep(1,m)
X <- X[c('V0','V1','V2')]
initial_theta <- rep(0,n+1)

#===== Computing cost of initial cost function ==========
cat(sprintf('Cost at initial theta (zeros): %f\n', cost(initial_theta,X,y)))
cat("Gradient at initial theta (zeros):\n")
print(gradient(initial_theta,X,y))
#Pausing execution
cat("Program paused. Press enter to continue...")
readline()
#===== Finding optimal parameters with optim function =====
# Finding optimal parameters with optim function.
# Tip from stackoverflow: http://stackoverflow.com/q/11546036/218584
# More info: ?optim
o <- optim(initial_theta, cost,X=X, y=y)
opt_params <- unlist(o["par"])
names(opt_params) <- c("theta0", "theta1","theta2")
# Printing values
cat(sprintf('Cost at theta found by optim: %f\n', o["value"]))
cat("Optimal params: \n")
print(opt_params)