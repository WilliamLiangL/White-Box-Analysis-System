# Update log
# fix imbalance problem
# improve model averaging
# cross validation

#install.packages('bnlearn')
#install.packages('caret', dependencies = TRUE)
#install.packages("BiocManager")
#BiocManager::install("Rgraphviz")

library(bnlearn)
library(caret)
library("Rgraphviz")

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

# check balance
bp = barplot(table(data$carcinoma))
text(bp, table(data$carcinoma)/2, table(data$carcinoma))
title('Before resample')

# define size of oversampling and undersampling
set.seed(123)
size = 1000
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

# check balance
bp = barplot(table(data.balanced$carcinoma))
text(bp, table(data.balanced$carcinoma)/2, table(data.balanced$carcinoma))
title('After resample')

# splite data to train and test
train_index = sample(seq_len(nrow(data.balanced)), size = floor(0.8 * nrow(data.balanced)))
#train = data.balanced[train_index, ]
train = data.balanced
test = data.balanced[-train_index, ]

# hc
# -------------------------------------------------------------------
# define threshold
t = 0.8
# apply bootstrap resampling to calculate averaged arc strengh
boot = boot.strength(data = train, R = 11, algorithm = "hc",
                     algorithm.args = list(score = "bde", iss = 10))
tryCatch({
  # build the averaged network structure
  avg.bn = averaged.network(boot, threshold = t)
  avg.bn = cextend(cpdag(avg.bn))
}, error = function(e) {
  print('fix partially directed graph')
  # fix partially directed graph
  boot[boot$direction == 0.5, 'direction'] = 0
  avg.bn = averaged.network(boot, threshold = t)
})

# print the averaged network
#print(avg.bn)
# plot a simple network graph
#graphviz.plot(avg.bn, layout = "fdp", shape = "circle")

# do parameter learning
fitted.bn = bn.fit(avg.bn, train, method='bayes')
#print(fitted.bn)

# test it and show accuracy
pred = predict(fitted.bn, node = 'carcinoma', data=test, method='bayes-lw', prob=TRUE)
print(confusionMatrix(pred, test$carcinoma))

# show ranking
rank = boot[boot$to == 'carcinoma' & boot$direction > 0.5, c('from', 'to', 'strength')]
print(rank[order(-rank$strength), ])

# cross validation 
cv = bn.cv(method = "k-fold",
           data = data.balanced,
           bn = avg.bn,
           loss = "pred",
           loss.args = list(target = "carcinoma"));
print(cv);
fold_index = 1;
print(confusionMatrix(cv[[fold_index]]$predicted, cv[[fold_index]]$observed))
# Averaged accuracy
total = 0;
for(i in 1:10){
  total = total + confusionMatrix(cv[[1]]$predicted, cv[[1]]$observed)$overall["Accuracy"]
}
print(paste("Averaged Accuracy : ", total/10))

  # gs
# -------------------------------------------------------------------
# define threshold
t = 0.8
# apply bootstrap resampling to calculate averaged arc strengh
boot = boot.strength(data = train, R = 11, algorithm = "pc.stable")
tryCatch({
  # build the averaged network structure
  avg.bn = averaged.network(boot, threshold = t)
  avg.bn = cextend(cpdag(avg.bn))
}, error = function(e) {
  print('fix partially directed graph')
  # fix partially directed graph
  boot[boot$direction == 0.5, 'direction'] = 0
  avg.bn = averaged.network(boot, threshold = t)
})

# print the averaged network
#print(avg.bn)
# plot a simple network graph
#graphviz.plot(avg.bn, layout = "fdp", shape = "circle")

# do parameter learning
fitted.bn = bn.fit(avg.bn, train, method='bayes')
#print(fitted.bn)

# test it and show accuracy
pred = predict(fitted.bn, node = 'carcinoma', data=test, method='bayes-lw', prob=TRUE)
print(confusionMatrix(pred, test$carcinoma))

# show ranking
rank = boot[boot$to == 'carcinoma' & boot$direction > 0.5, c('from', 'to', 'strength')]
print(rank[order(-rank$strength), ])

# 
# -------------------------------------------------------------------
# define threshold
t = 0.8
# apply bootstrap resampling to calculate averaged arc strengh
boot = boot.strength(data = train, R = 11, algorithm = "tabu")
tryCatch({
  # build the averaged network structure
  avg.bn = averaged.network(boot, threshold = t)
  avg.bn = cextend(cpdag(avg.bn))
}, error = function(e) {
  print('fix partially directed graph')
  # fix partially directed graph
  boot[boot$direction == 0.5, 'direction'] = 0
  avg.bn = averaged.network(boot, threshold = t)
})

# print the averaged network
#print(avg.bn)
# plot a simple network graph
#graphviz.plot(avg.bn, layout = "fdp", shape = "circle")

# do parameter learning
fitted.bn = bn.fit(avg.bn, train, method='bayes')
#print(fitted.bn)

# test it and show accuracy
pred = predict(fitted.bn, node = 'carcinoma', data=test, method='bayes-lw', prob=TRUE)
print(confusionMatrix(pred, test$carcinoma))

# show ranking
rank = boot[boot$to == 'carcinoma' & boot$direction > 0.5, c('from', 'to', 'strength')]
print(rank[order(-rank$strength), ])
