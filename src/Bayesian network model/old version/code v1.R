#install.packages('bnlearn')
#install.packages('caret', dependencies = TRUE)
#install.packages("BiocManager")
#BiocManager::install("Rgraphviz")

library(bnlearn)
library(caret)
library("Rgraphviz")

# read csv file
data = read.csv('HEPARTWO10k.csv')
print(str(data))
print(dim(data))

# check na value
print(lapply(data, function(x) sum(is.na(x))))

# handle missing data
for(i in 1:ncol(data)){
  if (sum(is.na(data[ , i])))
    data[is.na(data[,i]), i] <- median(data[,i], na.rm = TRUE)
}

# check data type
print(lapply(data, class))

# splite data to train and test
set.seed(123)
train_index = sample(seq_len(nrow(data)), size = floor(0.8 * nrow(data)))
train = data[train_index, ]
test = data[-train_index, ]

# do network structure learning by using hill climbing greedy search
bn = hc(train, start=NULL, whitelist=NULL, blacklist=NULL, score='bic')
print(bn)

# do parameter learning
fitted_bn = bn.fit(bn, train, method='bayes')
print(fitted_bn)

# test it and show accuracy
pred = predict(fitted_bn, node = 'carcinoma', data=test, method='bayes-lw', prob=TRUE)
print(confusionMatrix(pred, test$carcinoma))

# check balance
lapply(data, table)
table(pred)

# --------------------------------------------------------------------

# define size of oversampling and undersampling
size = 5000
data.present = data[data$carcinoma == 'present', ]
data.absent = data[data$carcinoma == 'absent', ]
# oversampling
oversample.index = sample(seq_len(nrow(data.present)), size=size, replace=TRUE)
data.oversample = data.present[oversample.index, ]
# undersamling
undersample.index = sample(seq_len(nrow(data.absent)), size=size, replace=FALSE)
data.undersample = data.absent[undersample.index, ]
# merge together
data.balanced <- rbind(data.oversample, data.undersample)

# splite data to train and test
set.seed(123)
train_index = sample(seq_len(nrow(data.balanced)), size = floor(0.8 * nrow(data.balanced)))
train = data.balanced[train_index, ]
test = data.balanced[-train_index, ]

# do network structure learning by using hill climbing greedy search
bn = hc(train, start=NULL, whitelist=NULL, blacklist=NULL, score='bic')
print(bn)

# do parameter learning
fitted_bn = bn.fit(bn, train, method='bayes')
print(fitted_bn)

# test it and show accuracy
pred = predict(fitted_bn, node = 'carcinoma', data=test, method='bayes-lw', prob=TRUE)
print(confusionMatrix(pred, test$carcinoma))
