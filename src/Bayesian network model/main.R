# Update log
# Add more comments and instructions to let users
# know how to use this program

# If you use this program for the first time, please run the following code
# Install library
func.installLibrary()

# When every time you reopen this program, please run the following code
# Load my own functions and third-party libraries
source('function.R')
func.loadLibrary()

# Run program without resampling
# Input data set and check it
target = 'carcinoma'
data = func.readData()
data = func.checkNA(data, replace=F)
data = func.checkType(data)
# Model traning and testing
bn.cv = func.learn(data, nFold=11, algorithm="hc",
                   algorithm.args=list(score = "bde", iss = 1)
                   ,target=target)
func.performancereport(bn.cv)
func.checkROCAUC(bn.cv)
# Predict and output
func.predictNewData(data, bn.cv, target)
output = func.output(bn.cv, target=target, threshold=0)

# Run program with SMOTE resampling
# Input data set and check it
target = 'carcinoma'
data = func.readData()
data = func.checkNA(data, replace=F)
data = func.checkType(data)
# SMOTE resampling
overSize = 1000
underSize = 9000
overRate = (overSize-min(table(data[target])))/min(table(data[target]))*100
underRate = underSize/(overSize-min(table(data[target])))*100
func.checkBalance(data, target=target, title='Before resample')
data.balanced = SMOTE(as.formula(paste(target,'~.')), data, k=10, perc.over=overRate, perc.under=underRate)
func.checkBalance(data.balanced, target=target, title='After resample')
# Model traning and testing
bn.cv = func.learn(data.balanced, nFold, algorithm="hc",
                   algorithm.args=list(score = "bde", iss = 1)
                   ,target=target)
func.performancereport(bn.cv)
func.checkROCAUC(bn.cv)
# Predict and output
func.predictNewData(data.balanced, bn.cv, target)
output = func.output(bn.cv, target=target, threshold=threshold)
