# title: "Run Students - Utils"
# author: "Corne Oosthuizen - OSTAND005"
# date: "29 June 2017"

training <- readRDS('data/student/training.rds')
testing <- readRDS('data/student/testing.rds')

fitControl <- trainControl(method = 'repeatedcv',
                           number = 4,
                           repeats = 4)

ll <- as.data.frame(cbind(
  c('lm', 'knn', 'brnn', 'ridge', 'rlm', 'glm', 'lasso', 'rvmPoly', 'rf', 'glmboost','svmPoly'),
  c('Linear Regression', 'k-Nearest Neighbors', 'Bayesian Regularized Neural Networks', 'Ridge Regression', 'Robust Linear Model', 'Generalized Linear Model', 'The lasso', 'Relevance Vector Machines with Polynomial Kernel', 'Random Forest', 'Boosted Generalized Linear Model','Support Vector Machines with Polynomial Kernel'), 
  0, 0, 0))

names(ll) <- c('Name', 'Method', 'RMSE', 'MSE', 'Time')
ll[,3] <- numeric(0)
ll[,4] <- numeric(0)
ll[,5] <- numeric(0)
