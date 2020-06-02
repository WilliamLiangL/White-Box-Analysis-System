# Update log
# update function to handle inf value and one level factor

func.installLibrary = function() {
  install.packages('bnlearn')
  install.packages('caret', dependencies = TRUE)
  install.packages("BiocManager")
  BiocManager::install("Rgraphviz")
  install.packages('DMwR')
  install.packages('ROSE')
}

func.loadLibrary = function() {
  require(bnlearn)
  require(caret)
  require("Rgraphviz")
  require(randomForest)
  require(DMwR)
  require(ROSE)
  require(tcltk)
  require(dplyr)
}

func.readData = function() {
  # read csv file
  filename = tclvalue(tkgetOpenFile(title='Open a file', filetypes = '{{CSV File} {.csv}}'))
  data = read.csv(filename)
  return(data)
}

func.checkNA = function(data, otherNAValue) {
  otherNAValue = '?'
  # handle missing data
  for(i in 1:ncol(data)){
    if (is.factor(data[ , i])) {
      # for factor data type
      temp = as.numeric(data[,i])
      data[is.na(data[,i]), i] = levels(data[,i])[median(temp, na.rm = TRUE)]
      data[data[,i]==otherNAValue, i] = levels(data[,i])[median(temp, na.rm = TRUE)]
      data[,i] = droplevels(data[,i])
    } else {
      # for numeric data type
      data[is.na(data[,i]), i] = median(data[,i], na.rm = TRUE)
      data[data[,i]==otherNAValue, i] = median(data[,i], na.rm = TRUE)
    }
  }
  return(data)
}

func.checkType = function(data) {
  toBeRemove = NULL
  # handle data type
  for(i in 1:ncol(data)){
    if (!is.factor(data[,i])) {
      if (nlevels(factor(data[,i]))<=1) {
        toBeRemove = c(toBeRemove, i)
      } else if (nlevels(factor(data[,i]))<=5) {
        data[,i] = factor(data[,i])
      }
      else {
        data[,i] = as.numeric(data[,i])
        data[,i] = cut(data[,i], breaks=unique(quantile(unique(data[,i]))), include.lowest=T)
      }
    }
  }
  data[,toBeRemove] = NULL
  #data = discretize(data, method='interval', breaks=4)
  return(data)
}

func.checkBalance = function(data, target, title) {
  # check balance
  bp = barplot(table(data[, target]))
  text(bp, table(data[, target])/2, table(data[, target]))
  title(title)
}

func.structurelearn = function(train, threshold, R, m, algorithm, algorithm.args) {
  # apply bootstrap resampling to calculate averaged arc strengh
  boot = boot.strength(data = train, R = R, m = m, algorithm = algorithm,
                         algorithm.args = algorithm.args)
  tryCatch({
    # build the averaged network structure
    avg.bn = averaged.network(boot, threshold = threshold)
    avg.bn = cextend(cpdag(avg.bn))
  }, error = function(e) {
    stop('Error in network averaging, please try to run again!')
  })
  return(avg.bn)
}

func.parameterlearn = function(bn, train) {
  # do parameter learning
  fitted.bn = bn.fit(avg.bn, train, method='bayes')
}

func.crossValidation = function(data, bn, target) {
  # cross validation 
  cv = bn.cv(method = "k-fold",
             data = data,
             bn = bn,
             loss = "pred",
             loss.args = list(target = target));
  print(cv);
  pred = NULL
  obse = NULL
  for(i in 1:10){
    pred = c(pred, as.character(cv[[i]]$predicted))
    obse = c(obse, as.character(cv[[i]]$observed))
  }
  pred = factor(pred)
  obse = factor(obse)
  print(confusionMatrix(pred, obse, mode = "everything"))
}

func.randomForest = function(data, formula) {
  # random forest
  randf = randomForest(formula,data,importance =TRUE)
  importance = importance(randf)
  View(importance)
  par(mfrow = c(1,1))
  varImpPlot(randf,sort =TRUE)
  return(as.data.frame(importance))
}

func.selectImportantAtt = function(data, importance, threshold, target) {
  importance = importance[importance$MeanDecreaseAccuracy >= threshold, ]
  important.nodes = rownames(importance)
  data.important = data[, c(important.nodes, target)]
  return(data.important)
}

func.output = function(avg.bn, data, target) {
  arc = arc.strength(avg.bn, data, criterion = 'bde')
  arc = func.adjust(arc, target, '')
  arc = group_by(arc, to) %>% transmute(from, percent=(strength+min(arc$strength))/sum(strength+min(arc$strength)))
  arc = arc[order(arc$to), ]
  rownames(arc) = NULL
  filename = tclvalue(tkgetSaveFile(title='Save a file', filetypes = '{{CSV File} {.csv}}'))
  if (substr(filename, nchar(filename)-3, nchar(filename)) != '.csv')
    filename = paste(filename, '.csv', sep='')
  write.table(arc, filename, sep=',', row.names=T, col.names=F)
  return(arc)
}

func.adjust = function(arc, parent, grandparent) {
  index = which(arc$from==parent & !(arc$to%in%grandparent))
  if (length(index)>0) {
    arc[index,]$from = arc[index,]$to
    arc[index,]$to = parent
  }
  child = arc[arc$to==parent,]$from
  if (length(child)> 0) {
    for (i in 1:length(child)) {
      arc = func.adjust(arc, child[i], c(parent,grandparent))
    }
  }
  return(arc)
}

func.checkROCAUC = function(obse, pred) {
  rocauc = roc.curve(obse, pred, plotit=F)
  print(rocauc)
  if (rocauc$auc <= 0.5)
    stop('It is an imbalanced dataset, please try to resample it and run again!')
}

target = 'carcinoma'
nFold = 10
sizeFold = floor(nrow(data)/nFold)
threshold = 0.5

# without resampling
#func.installLibrary()
func.loadLibrary()
data = func.readData()
data = func.checkNA(data)
data = func.checkType(data)
avg.bn = func.structurelearn(data, threshold=threshold, R=nFold, m=sizeFold, algorithm="hc",
                             algorithm.args=list(score = "bde", iss = 1))
fitted.bn = func.parameterlearn(avg.bn, train=data)
pred = predict(fitted.bn, node=target, data=data, method='bayes-lw', prob=TRUE)
func.crossValidation(data, bn=avg.bn, target=target)
output = func.output(avg.bn, data, target=target)
func.checkROCAUC(data[,target], pred)

# with SMOTE resampling
overSize = 1000
underSize = 9000
overRate = (overSize-634)/634*100
underRate = underSize/(overSize-634)*100
func.checkBalance(data, target=target, title='Before resample')
data.balanced = SMOTE(as.formula(paste(target,'~.')), data, k=10, perc.over=overRate, perc.under=underRate)
func.checkBalance(data.balanced, target=target, title='After resample')
avg.bn = func.structurelearn(data.balanced, threshold=threshold, R=nFold, m=sizeFold, algorithm="hc",
                             algorithm.args=list(score = "bde", iss = 1))
fitted.bn = func.parameterlearn(avg.bn, train=data.balanced)
pred = predict(fitted.bn, node=target, data=data.balanced, method='bayes-lw', prob=TRUE)
func.crossValidation(data.balanced, bn=avg.bn, target=target)
output = func.output(avg.bn, data.balanced, target=target)
func.checkROCAUC(data.balanced[,target], pred)

# select important attributes
importance = func.randomForest(data.balanced, formula=as.formula(paste(target,'~.')))
meanImportance = median(importance$MeanDecreaseAccuracy)
data.important = func.selectImportantAtt(data.balanced, importance, threshold=meanImportance, target=target)
avg.bn = func.structurelearn(data.important, threshold=threshold, R=nFold, m=sizeFold, algorithm="hc",
                             algorithm.args=list(score = "bde", iss = 1))
fitted.bn = func.parameterlearn(avg.bn, train=data.important)
func.crossValidation(data.important, bn=avg.bn, target=target)
