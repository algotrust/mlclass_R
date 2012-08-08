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
source('warmUpExcercise.R')
source('plotData.R')

#================ Part 1:warming up ==========
cat('Running upwarmup excercise...\n')
cat('5x5 Identity matrix:\n')
print(warmUp())

#================ Part 2: Reading data and plotting ==========
data <- read.delim("ex1data1.txt", header=FALSE, sep=",")
names(data) <- c('Population','Profit')
plotData(data)

