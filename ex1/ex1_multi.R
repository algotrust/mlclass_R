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
