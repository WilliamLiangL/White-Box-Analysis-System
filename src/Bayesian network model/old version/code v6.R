# Update log
# Organize the code, subdivide code into different functions
# Use random forest to find important attributes

#install.packages('bnlearn')
#install.packages('caret', dependencies = TRUE)
#install.packages("BiocManager")
#BiocManager::install("Rgraphviz")

library(bnlearn)
library(caret)
library("Rgraphviz")
library(randomForest)

func.readData = function(filename) {
  # read csv file
  data = read.csv(filename)
  #print(str(data))
  #print(dim(data))
  return(data)
}

func.checkNA = function(data) {
  # check na value
  #print(lapply(data, function(x) sum(is.na(x))))
  
  # handle missing data
  for(i in 1:ncol(data)){
    if (sum(is.na(data[ , i])))
      data[is.na(data[,i]), i] <- median(data[,i], na.rm = TRUE)
  }
  return(data)
}

func.checkType = function(data) {
  # check data type
  #print(lapply(data, class))
  
  # handle data type
  for(i in 1:ncol(data)){
    if (!is.factor(data[ , 1]))
      data[ , 1] <- factor(data[ , 1])
  }
  return(data)
}

func.checkBalance = function(data, target, title) {
  # check balance
  bp = barplot(table(data[, target]))
  text(bp, table(data[, target])/2, table(data[, target]))
  title(title)
}

func.balance = function(data, seed, size) {
  # define size of oversampling and undersampling
  set.seed(seed)
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
  return(data.balanced)
}

func.splite = function(data, seed, threshold) {
  # splite data to train and test
  set.seed(seed)
  train_index = sample(seq_len(nrow(data)), size = floor(threshold * nrow(data)))
  #train <<- data[train_index, ]
  train <<- data
  test <<- data[-train_index, ]
}

func.structurelearn = function(train, threshold, R, algorithm, algorithm.args) {
  # apply bootstrap resampling to calculate averaged arc strengh
  boot <<- boot.strength(data = train, R = R, algorithm = algorithm,
                       algorithm.args = algorithm.args)
  tryCatch({
    # build the averaged network structure
    avg.bn = averaged.network(boot, threshold = threshold)
    avg.bn = cextend(cpdag(avg.bn))
  }, error = function(e) {
    print('fix partially directed graph')
    # fix partially directed graph
    boot[boot$direction == 0.5, 'direction'] = 0
    avg.bn = averaged.network(boot, threshold = threshold)
  })
  # print the averaged network
  #print(avg.bn)
  # plot a simple network graph
  #graphviz.plot(avg.bn, layout = "fdp", shape = "circle")
  return(avg.bn)
}

func.parameterlearn = function(bn, train) {
  # do parameter learning
  fitted.bn = bn.fit(avg.bn, train, method='bayes')
  #print(fitted.bn)
}

func.predict = function(fitted.bn, target, test) {
  # test it and show accuracy
  pred = predict(fitted.bn, node = target, data=test, method='bayes-lw', prob=TRUE)
  print(confusionMatrix(pred, test[, target]))
}

func.ranking = function(traget) {
  # show ranking
  rank = boot[boot$to == traget & boot$direction > 0.5, c('from', 'to', 'strength')]
  print(rank[order(-rank$strength), ])
}

func.crossValidation = function(data, bn, target) {
  # cross validation 
  cv = bn.cv(method = "k-fold",
             data = data,
             bn = bn,
             loss = "pred",
             loss.args = list(target = target));
  print(cv);
  fold_index = 1;
  #print(confusionMatrix(cv[[fold_index]]$predicted, cv[[fold_index]]$observed))
  # Averaged accuracy
  total = 0;
  for(i in 1:10){
    total = total + confusionMatrix(cv[[1]]$predicted, cv[[1]]$observed)$overall["Accuracy"]
  }
  print(paste("Averaged Accuracy : ", total/10))
}

func.randomForest = function(data, formula) {
  # random forest
  randf <- randomForest(formula,data,importance =TRUE)
  importance = importance(randf)
  View(importance)
  par(mfrow = c(1,1))
  varImpPlot(randf,sort =TRUE)
  return(as.data.frame(importance))
}

func.selectImportantAtt = function(data.balanced, importance, threshold) {
  importance = importance[importance$MeanDecreaseAccuracy > threshold, ]
  important.nodes = rownames(importance)
  data.important = data.balanced[, c(important.nodes, 'carcinoma')]
  return(data.important)
}

train = NULL
test = NULL
boot = NULL

data = func.readData('HEPARTWO10k.csv')
data = func.checkNA(data)
data = func.checkType(data)
func.checkBalance(data, target='carcinoma', title='Before resample')
data.balanced = func.balance(data, seed=123, size=1000)
func.checkBalance(data.balanced, target='carcinoma', title='After resample')
func.splite(data.balanced, seed=123, threshold=0.8)
avg.bn = func.structurelearn(train, threshold=0.8, R=11, algorithm="hc",
                             algorithm.args=list(score = "bde", iss = 10))
fitted.bn = func.parameterlearn(avg.bn, train=train)
func.predict(fitted.bn, target='carcinoma', test=test)
func.ranking(traget='carcinoma')
#func.crossValidation(data.balanced, bn=avg.bn, target='carcinoma')

# select important attributes
importance = func.randomForest(data.balanced, formula=as.formula(paste('carcinoma~.')))
data.important = func.selectImportantAtt(data.balanced, importance, threshold=25)
func.splite(data.important, seed=123, threshold=0.8)
avg.bn = func.structurelearn(train, threshold=0.8, R=11, algorithm="hc",
                             algorithm.args=list(score = "bde", iss = 10))
fitted.bn = func.parameterlearn(avg.bn, train=train)
func.predict(fitted.bn, target='carcinoma', test=test)
