#!/usr/bin/Rscript
library(R.matlab)
#Closing all the plots and resetting all the variables in the workspace
graphics.off()
rm(list = ls())

source('lrCostFunction.R')
source('oneVsAll.R')
source('predict.R')
source('predictOneVsAll.R')

data <- readMat('ex3data1.mat')
X <- unlist(data['X'])
# There are 5000 training examples, each containing 400 pixels. 
# THus we should convert X from a vector with 2.000.000 elements to 
# 5000 X 400 matrix
X <- matrix(X, nrow=5000)
y <-unlist(data['y'])
# Plotting 100 random image matrices
# First: Specifying plot parameters: pin - size of single image (in), mfrow - dimensions of matrix of plots
# mai - margins
par(pin=c(0.2,0.2), mfrow=c(10,10), mai=c(0.01,0.01,0.01,0.01))

# Tipped off here: http://stackoverflow.com/questions/5638462/r-image-of-a-pixel-matrix
# And here: http://stackoverflow.com/questions/7991056/change-origin-in-image-plot-of-matrix-in-r
for (i in 1:100) {
  image(t(matrix(X[sample(1:nrow(X),1),],nrow=20)[20:1,]),
        axes=FALSE,
        col = grey(seq(0, 1, length = 256)))  
}
