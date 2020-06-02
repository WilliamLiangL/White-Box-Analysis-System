# Update log
# try feature selection algorithm

#install.packages('bnlearn')
#install.packages('caret', dependencies = TRUE)
#install.packages("BiocManager")
#BiocManager::install("Rgraphviz")

library(bnlearn)
library(caret)
library("Rgraphviz")
library(randomForest)

# read csv file
data = read.csv('HEPARTWO10k.csv')
#print(str(data))
#print(dim(data))

# check na value
#print(lapply(data, function(x) sum(is.na(x))))

# handle missing data
for(i in 1:ncol(data)){
  if (sum(is.na(data[ , i])))
    data[is.na(data[,i]), i] <- median(data[,i], na.rm = TRUE)
}

# check data type
#print(lapply(data, class))

# random forest
randf <- randomForest(carcinoma~. ,data,importance =TRUE)
importance = importance(randf)
View(importance)
par(mfrow = c(1,1))
varImpPlot(randf,sort =TRUE)

# For Mean Decrease in Accuracy:
#   Imagine you have a model built using a few variables including gender to predict if a person prefers coffee white or black.
#   Take one variable and scramble it in a way that matches the distribution of the variable (e.g. if the variable is gender and 60% of the observations are male, than randomly assign male to 60% of the set - preserve the distribution but scramble the observations).
#   Measure the predictive accuracy of the resulting tree.
#   Repeat for each variable.
#   The loss of accuracy is the Mean Decrease in Accuracy.
#   Note that this is not causal - and in practical use I would focus on the ranking of the variable as a data point for further investigation rather than the actual magnitude of the measure.
# For Mean Decrease in Gini (Index):
#   Imagine you are looking at one of the nodes just above the leaves in a decision tree where you are predicting whether someone prefers white or black coffee.
#   At this node, the model has the chance to split by multiple variables.
#   It does this by searching for the variable to split where the split gives the lowest Gini index (lower is 'purer' / 'better').
#   If the model chooses to split by gender, the subsequent left node (e.g. male) observations may all like black coffee and the right node (e.g. female) may all like white coffee (i.e. both nodes are 100% 'pure' and hits the lowest Gini Index of 0).
#   If the model chooses another variable, the subsequent left and right nodes may have a mix of outcomes (i.e. be less pure, with a larger Gini index).
#   This is not optimal and finally the model chooses to go with gender.