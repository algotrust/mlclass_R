#!/usr/bin/Rscript
library(ggplot2)
#Closing all the plots and resetting all the variables in the workspace
graphics.off()
rm(list = ls())

source("sigmoid.R")
source("costFunctionReg.R")
source("predict.R")

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
#======= Part2