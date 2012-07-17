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
cost <- costFun(initial_theta,X,y)
print(paste('Cost at initial theta (zeros):', cost["cost"]))
print("Gradient at initial theta (zeros):")
print(cost["gradient"])
#Pausing execution
cat("Hit <enter> to continue...")
readline()
