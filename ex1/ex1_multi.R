#!/usr/bin/Rscript
# Advanced branch:
# 1) Use ggplot2 package to plot excercise data
# 2) Calculate error on training set with params, calculated with other optimization algorithms

library(ggplot2)
#Closing all the plots and resetting all the variables in the workspace
graphics.off()
rm(list = ls())

source('computeCost.R')
source('gradientDescent.R')
source('featureNormalize.R')
source('normalEqn.R')
source('plotData.R')

#========= Part 1. Feature normalization ==========
# Importing data 
data <- read.delim('ex1data2.txt',sep=",",header=FALSE)
X <- data[,c('V1','V2')]
y <- data[,c('V3')]
m <- nrow(X)
n <- ncol(X)

#======Part 1: normalizing features ===========
X.norm <- featureNormalize(X)
mju <- apply(X,2,median)
stddev <- apply(X,2,sd)
X.norm$V0 <- rep(1,m)
X.norm <- X.norm[c('V0','V1','V2')]

#======Part 2: running gradient descent ======
# Necessary variables for gradient descent 
initial_theta <- rep(0,n+1)
iterations <- 1500
alpha <- 0.01

print("Running gradient descent...")
opt_params <- gradientDescent(X.norm,y,initial_theta,alpha,iterations)

opt_theta <- unlist(opt_params['theta'])
names(opt_theta)<-c('theta0','theta1','theta2')

print('Optimal parameters found by gradient descent: ')
print(opt_theta)
cat(sprintf('Cost at optimal parameters: %f',computeCost(X,y,opt_theta)))

#=========== Part 3: Normal equations ========

