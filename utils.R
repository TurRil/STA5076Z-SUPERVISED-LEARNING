suppressMessages(library(mmand))
suppressMessages(library(PET))

rotate <- function(m) { t(apply(m, 1, rev)) }

print4 <- function(df, s = 28, n = 0) {
  
  par(mfrow=c(1,4), bty="n")
  for(i in 1:4) {
    
    img <- matrix(unlist(df[n+i,-1]), nrow = s)
    image(img, col = gray((128-(0:128))/128), xaxt='n', yaxt='n', asp=1, main = df[n+i, 1])
  }
}

print5 <- function(df, s = 28, n = 0) {
  
  par(mfrow=c(1,5), bty="n")
  for(i in 1:nrow(df)) {
    
    img <- matrix(unlist(df[n+i,-1]), nrow = s)
    image(img, col = gray((128-(0:128))/128), xaxt='n', yaxt='n', asp=1, main = df[n+i, 1])
  }
}

randomRows = function(df,n){
  return(df[sample(nrow(df),n),])
}

readDF <- function(filename) {
  df <- read.table(filename, header = T, dec = ".", sep =",")
  return (df[ , !(names(df) %in% c('X'))]); # drop number column)
}

getEmptyStat <- function() {
  
  return (cbind(
    name = character(0), # name
    type = character(0), # type
    pixels = integer(0), # contains pixel data - dimensions 28 (28x28)
    sym = integer(0),    # contains symmetry data
    pca = integer(0),    # pca applied
    sk = integer(0),     # skeletonise applied
    obs = integer(0),    # number of observations 
    var = integer(0),    # number of variables
    time_s = numeric(0), # execution time for this dataset
    size_b = numeric(0))) # size of the dataset
}

returnStat <- function(name = "tmp", type = "tmp", pixels = 0, sym = 0, pca = 0, sk = 0, obs = 0, var = 0, time_s = 0, size_b = 0) {
  
  return (c(name, as.character(type), pixels, sym, pca, sk, obs, var, time_s, size_b))
}

if(file.exists('data/dataset_creation.csv')){
  dataset.stats <- readDF('data/dataset_creation.csv')
  dataset.stats[,1] <- as.character(dataset.stats[,1])
  dataset.stats[,2] <- as.character(dataset.stats[,2])
} else {
  dataset.stats <- getEmptyStat()
}

myset <- c(0,2,4,6,7)

#rm(list = ls())