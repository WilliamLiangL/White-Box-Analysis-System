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

# define threshold
t = 0.85
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
print(avg.bn)
# plot a simple network graph
#graphviz.plot(avg.bn, layout = "fdp", shape = "circle")

# do parameter learning
fitted.bn = bn.fit(avg.bn, train, method='bayes')
print(fitted.bn)

# test it and show accuracy
pred = predict(fitted.bn, node = 'carcinoma', data=test, method='bayes-lw', prob=TRUE)
print(confusionMatrix(pred, test$carcinoma))

# check balance
lapply(data, table)
table(pred)
