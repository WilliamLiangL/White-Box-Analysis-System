func.installLibrary = function() {
  install.packages('bnlearn')
  install.packages('caret', dependencies = TRUE)
  install.packages('DMwR')
  install.packages('ROSE')
}

func.loadLibrary = function() {
  require(bnlearn)
  require(caret)
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

func.checkNA = function(data, replace) {
  if (replace==T) {
    # replace missing data
    for(i in 1:ncol(data)){
      if (is.factor(data[ , i])) {
        # for factor data type
        temp = as.numeric(data[,i])
        data[is.na(data[,i]), i] = levels(data[,i])[median(temp, na.rm = TRUE)]
        data[is.infinite(data[,i]), i] = levels(data[,i])[median(temp, na.rm = TRUE)]
        data[,i] = droplevels(data[,i])
      } else {
        # for numeric data type
        data[is.na(data[,i]), i] = median(data[,i], na.rm = TRUE)
        data[is.infinite(data[,i]), i] = median(data[,i], na.rm = TRUE)
      }
    }
  } else {
    # delete missing data
    data = na.omit(data)
    data = data[apply(data, 1, function(x) all(!is.infinite(x))),]
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

func.learn = function(data, nFold, algorithm, algorithm.args, target) {
  nFold = ifelse(nFold%%2==0, nFold+1, nFold)
  # do bayesian networks learning and cross-validation
  bn.cv = bn.cv(data, k = nFold,
                bn = algorithm, algorithm.args = algorithm.args,
                loss = "pred", loss.args = list(target = target))
  return(bn.cv)
}

func.performancereport = function(bn) {
  # performance report
  pred = unlist(lapply(bn, `[[`, "predicted"))
  obse = unlist(lapply(bn, `[[`, "observed"))
  pred = factor(pred)
  obse = factor(obse)
  print(confusionMatrix(pred, obse, mode = "everything"))
}

func.output = function(bn, target, threshold) {
  arc = custom.strength(bn)
  arc = arc[arc$direction>0.5, c('from', 'to', 'strength')]
  arc = arc[arc$strength>=threshold, ]
  arc$adjusted = F
  arc = func.adjust(arc, target)
  arc = group_by(arc, to) %>% transmute(from, percent=(strength+min(arc$strength))/sum(strength+min(arc$strength)))
  arc = arc[order(arc$to), ]
  rownames(arc) = NULL
  filename = tclvalue(tkgetSaveFile(title='Save a file', filetypes = '{{CSV File} {.csv}}'))
  if (substr(filename, nchar(filename)-3, nchar(filename)) != '.csv')
    filename = paste(filename, '.csv', sep='')
  write.table(arc, filename, sep=',', row.names=T, col.names=F)
  return(arc)
}

func.adjust = function(arc, parent) {
  index = which(arc$from==parent & arc$adjusted==F)
  if (length(index)>0) {
    arc[index,]$from = arc[index,]$to
    arc[index,]$to = parent
  }
  child = arc[arc$to==parent & arc$adjusted==F,]$from
  arc[arc$to==parent, 'adjusted'] = T
  if (length(child)> 0) {
    for (i in 1:length(child)) {
      arc = func.adjust(arc, child[i])
    }
  }
  return(arc)
}

func.checkROCAUC = function(bn) {
  pred = unlist(lapply(bn, `[[`, "predicted"))
  obse = unlist(lapply(bn, `[[`, "observed"))
  pred = factor(pred)
  obse = factor(obse)
  rocauc = roc.curve(obse, pred, plotit=F)
  print(rocauc)
  if (rocauc$auc <= 0.5)
    stop('It is an imbalanced dataset, please try to resample it and run again!')
}

func.predictNewData = function(data, bn, target) {
  # build input template
  input.template = data.frame(matrix(ncol=ncol(data), nrow = 0))
  colnames(input.template)=colnames(data)
  for(i in 1:ncol(input.template)){
    input.template[1,i] = paste(levels(data[,i]),collapse='/')
  }
  input.template[,target] = NULL
  # save input template
  print('Please save the input template, fill in, and open again!')
  filename = tclvalue(tkgetSaveFile(title='Save a file', filetypes = '{{CSV File} {.csv}}'))
  if (substr(filename, nchar(filename)-3, nchar(filename)) != '.csv')
    filename = paste(filename, '.csv', sep='')
  write.table(input.template, filename, sep=',', row.names=F, col.names=T)
  # read csv file
  filename = tclvalue(tkgetOpenFile(title='Open a file', filetypes = '{{CSV File} {.csv}}'))
  newdata = read.csv(filename, stringsAsFactors=F)
  # set proper factor level
  for(i in 1:ncol(newdata)){
    newdata[,i]=factor(newdata[,i],levels = levels(data[,i]))
  }
  # predict the result
  fitted = lapply(bn, `[[`, "fitted")
  pred = sapply(fitted, predict, node=target, data=newdata)
  if (is.null(nrow(pred))) {
    print(table(pred,dnn=paste('Predicted result (in %):'))/length(pred))
  } else {
    for(i in 1:nrow(pred)){
      print(table(pred[i,],dnn=paste('Predicted result of row#',i,'(in %):'))/length(pred[i,]))
    }
  }
}