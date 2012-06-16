library(ggplot2)
#Closing all the plots and resetting all the variables in the workspace
graphics.off()
rm(list = ls())

#Loading files filled in manually
source("sigmoid.R")
source("costFunction.R")
source("predict.R")

data <- read.delim("ex2data1.txt", header=FALSE, sep=",")
data$V3 <- factor(data$V3)

p <- ggplot(data, aes(x = V1, y = V2, color = V3, shape = V3)) +
   geom_point() +
   scale_x_continuous("Exam 1 score") +
   scale_y_continuous("Exam 2 score") +
   scale_colour_hue(name = "Admitted?", labels=c("No", "Yes")) +
   scale_shape(name = "Admitted?", labels=c("No", "Yes"))
   
print(p)