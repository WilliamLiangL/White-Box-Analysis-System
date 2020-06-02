#install.packages('bnlearn')
#install.packages('caret', dependencies = TRUE)
#install.packages("BiocManager")
#BiocManager::install("Rgraphviz")

library(bnlearn)
library(caret)
library("Rgraphviz")

# read data
data = read.csv('processed.cleveland.data', 
                header = FALSE, 
                na.strings = c(NA, '?'), 
                col.names = c('age', 'sex', 'cp', 'trestbps', 'chol', 'fbs', 'restecg', 'thalach', 'exang', 'oldpeak', 'slope', 'ca', 'thal', 'heart_disease'))

# handle missing data
for(i in 1:ncol(data)){
  data[is.na(data[,i]), i] <- median(data[,i], na.rm = TRUE)
}

# convert data to correct data type
data$heart_disease[data$heart_disease==2] = 1
data$heart_disease[data$heart_disease==3] = 1
data$heart_disease[data$heart_disease==4] = 1
data$sex = as.factor(data$sex)
data$cp = as.factor(data$cp)
data$fbs = as.factor(data$fbs)
data$restecg = as.factor(data$restecg)
data$exang = as.factor(data$exang)
data$slope = as.factor(data$slope)
data$ca = as.factor(data$ca)
data$thal = as.factor(data$thal)
data$heart_disease = as.factor(data$heart_disease)
data_discret = discretize(data, method = 'interval')

# splite data to train and test
set.seed(123)
train_index = sample(seq_len(nrow(data_discret)), size = floor(0.8 * nrow(data_discret)))
train = data_discret[train_index, ]
test = data_discret[-train_index, ]

# do network structure learning by using hill climbing greedy search
bn = hc(train)

#plot the network structure
graphviz.plot(bn, layout = "fdp", shape = "circle")

# do parameter learning
fitted = bn.fit(bn, train)

# show the possibility of an event based on the evidence
print('male:')
print(cpquery(fitted, event = (heart_disease==0), evidence = (sex==0)))
print(cpquery(fitted, event = (heart_disease==1), evidence = (sex==0)))
print('female:')
print(cpquery(fitted, event = (heart_disease==0), evidence = (sex==1)))
print(cpquery(fitted, event = (heart_disease==1), evidence = (sex==1)))

# test it and show accuracy
pred = predict(fitted, node = 'heart_disease', data = test)
print(confusionMatrix(pred, test$heart_disease))

# export to bif
write.bif('bn.bif', fitted)
