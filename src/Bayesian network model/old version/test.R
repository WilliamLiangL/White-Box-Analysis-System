library(bnlearn)
library(caret)

# read data
data = read.csv('processed.cleveland.data', 
                header = FALSE, 
                na.strings = c(NA, '?'), 
                col.names = c('age', 'sex', 'cp', 'trestbps', 'chol', 'fbs', 'restecg', 'thalach', 'exang', 'oldpeak', 'slope', 'ca', 'thal', 'heart_disease'))

# data preprocessing
for(i in 1:ncol(data)){
  data[is.na(data[,i]), i] <- mean(data[,i], na.rm = TRUE)
}
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
data = discretize(data, method = 'interval')

# splite data to train and test
set.seed(123)
train_index = sample(seq_len(nrow(data)), size = floor(0.8 * nrow(data)))
train = data[train_index, ]
test = data[-train_index, ]

# create and fit naive.bayes
bn = naive.bayes(data, 'heart_disease')
fitted = bn.fit(bn, train)

# predict and performance test
pred = predict(fitted, test)
print(confusionMatrix(pred, test$heart_disease))

# create graph
graph = hc(data)

# remove useless
graph$arcs = graph$arcs[-which((graph$arcs[,'to'] == 'heart_disease')),]
plot(graph)
