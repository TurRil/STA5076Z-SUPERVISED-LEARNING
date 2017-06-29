# title: "Run KNN"
# author: "Corné Oosthuizen - OSTAND005"
# date: "29 June 2017"

library(caret)
library(FNN)

train <- as.data.frame(readRDS('data/train_14_symAdd_pca.rds'))
test <- as.data.frame(readRDS('data/test_14_symAdd_pca.rds'))

names(test)[1] <- "label"
train[,1] <- as.factor(train[,1])

names(test)[1] <- "label"
test[,1] <- as.factor(test[,1])


mod.file <- "results/digit_knn.rds"
mod.txt <- "results/digit_knn.txt"

  if (file.exists(mod.file)) {
  
    mod <- readRDS(mod.file)
  } else {

    startTime <- Sys.time()

    mod <- knn( train = train[,-1], test = test[,-1], cl = train$label, k = 5, algorithm=c("kd_tree"))
    
    endTime <- Sys.time()
    runTime <- as.numeric(difftime(endTime, startTime, units = "secs"))
    
    saveRDS(mod, file = mod.file)
  }

cm <- confusionMatrix(mod, test$label)
accuracy <- cm$overall["Accuracy"]

fc <- file(mod.txt)
writeLines (paste("RunTime: ", runTime), fc)
writeLines (paste("Accuracy: ", accuracy), fc)
close(fc)
