# title: "Run Students - Generate Data"
# author: "Corne Oosthuizen - OSTAND005"
# date: "29 June 2017"

# load the library
library(caret)

d1 <- read.table("data/student/student-mat.csv", sep=";", header=TRUE)
d2 <- read.table("data/student/student-por.csv", sep=";", header=TRUE)

d3 <- merge(d1, d2, by=c("school", "sex", "age", "address", "famsize", "Pstatus", "Medu", "Fedu", "Mjob", "Fjob", "reason", "nursery", "internet"))


intrain <- createDataPartition(y = d2$G3, p= 0.75, list = FALSE)
training <- d2[intrain,]
testing <- d2[-intrain,]

saveRDS(training, file = 'data/student/training.rds')
saveRDS(testing, file = 'data/student/testing.rds')
