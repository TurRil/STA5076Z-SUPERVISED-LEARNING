# title: "Run Students - G3"
# author: "Corne Oosthuizen - OSTAND005"
# date: "29 June 2017"

# load the library
library(caret)
library(Metrics)

source("run_student_utils.R")

training <- training[ , !(names(training) %in% c("G1", "G2"))]
testing <- testing[ , !(names(testing) %in% c("G1", "G2"))]

for (i in 1:nrow(ll)) {
  
  mod.file <- paste("results/student_", ll[i, 1], "_g3.rds", sep="")
  
  if (file.exists(mod.file)) {
  
    mod <- readRDS(mod.file)
  } else {

    startTime <- Sys.time()

    mod <- train(G3 ~ ., 
               data = training,
               method = ll[i, 1],
               trControl = fitControl)
    
    saveRDS(mod, file = mod.file)

    endTime <- Sys.time()
    pred <- predict(mod, newdata = testing)
    ll[i, 3] <- as.numeric(rmse(testing$G3, pred))
    ll[i, 4] <- as.numeric(mse(testing$G3, pred))
    ll[i, 5] <- as.numeric(difftime(endTime, startTime, units = "secs")) 
  }
  assign( paste("student.", ll[i, 1], sep=""), mod)
}

saveRDS(ll, file = "results/students_g3.rds")