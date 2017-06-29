library(rmarkdown)

rmarkdown::render("run.Rmd", "html_document")


# create an svg image
library(svglite)
library(ggplot2)

svglite("plot.svg", width = 10, height = 7)

qplot(mpg, wt, data = mtcars, colour = factor(cyl))

dev.off()

# render it into a bitmap array
library(rsvg)
bitmap <- rsvg("plot.svg")
dim(bitmap)
## [1] 504 720   4

# write to format
png::writePNG(bitmap, "bitmap.png")
jpeg::writeJPEG(bitmap, "bitmap.jpg", quality = 1)
webp::write_webp(bitmap, "bitmap.webp", quality = 100)


# render it into a bitmap array
bitmap <- rsvg("plot.svg", width = 3840)
png::writePNG(bitmap, "plot_4k.png", dpi = 144)
browseURL("plot_4k.png")


# render straight to output format
rsvg_pdf("plot.svg", "out.pdf")
rsvg_ps("plot.svg", "out.ps")
rsvg_svg("plot.svg", "out.svg")
rsvg_png("plot.svg", "out.png")
rsvg_webp("plot.svg", "out.webp")

#Added bonus is that librsvg does not only do a really good job rendering, it is also super fast. 
#It would even be fast enough to render the svg tiger on the fly at 10~20fps!

download.file("http://dev.w3.org/SVG/tools/svgweb/samples/svg-files/tiger.svg", "tiger.svg")
system.time(bin <- rsvg_raw("tiger.svg"))
#   user  system elapsed
#  0.048   0.003   0.057
system.time(rsvg_webp("tiger.svg", "tiger.webp"))
#    user  system elapsed
#  0.097   0.006   0.115

suppressMessages(library(mmand))
suppressMessages(library(PET))

resizeData <- function(inputDF, size) {
  
  newDF <- data.frame(matrix(ncol = (size*size), nrow = nrow(inputDF)))
  newNames <- c('label')
  
  for (i in 1:size) {
    newNames <- c(newNames, paste0('v',i,'_', 1:size))
  }
  
  #row.names(newDF) <- newNames
  
  for (i in 1:nrow(inputDF)) {
    
    digit <- matrix(as.numeric(inputDF[i, -1]), nrow = 28)
    
    s <- rescale(digit, size/28, triangleKernel())
    newDF[i, ] <- as.vector(s)
  }
  resultDF <- cbind(inputDF$label, newDF)
  names(resultDF) <- newNames
  return(resultDF)
}

ss <- c(28, 14, 7)
for(i in 1:length(ss)) {
  startTime <- Sys.time()
  
  w.train <- resizeData(train, ss[i])
  w.test <- resizeData(test, ss[i])
  write.csv(w.train, file = paste('data/train_',ss[i],'.csv'))
  write.csv(w.test, file = paste('data/train_',ss[i],'.csv'))
  
  endTime <- Sys.time()
  print(paste(" time (",ss[i],":", trainingTime));
}


trainWrapper <- function(modelType, fitControl, trainData) {
  set.seed(99)  # helpful for reproducibility
  startTime <- Sys.time()
  model <- train(label ~ ., data = trainData,
                 method = modelType,
                 trControl = fitControl)
  endTime <- Sys.time()
  trainingTime <- endTime - startTime
  print(paste(modelType, " training time:", trainingTime))
  return(model)
}
#ss <- seq(from = 0.75, to = 0.25, length.out = 5)
#
#  s <- rescale(t1, ss[i], triangleKernel())
#  image(s, col = gray(128:0/128), xaxt='n', yaxt='n', asp=1, main=paste(dim(s)))
#}

#compData <- data.frame(name = character(0), obs = numeric(0), var = integer(0), time = numberic(0), size = numeric(0))
#compData
#compData <- rbind(compData, c(5, 443, 's'), names(compData))
#compData


readDF <- function(filename) {
  df <- read.table(filename, header = T, dec = ".", sep =",")
  return (df[ , !(names(df) %in% c('X'))]); # drop number column)
}

train.28 <- readDF('data/train_28.csv')
train.14 <- readDF('data/train_14.csv')
train.7 <- readDF('data/train_7.csv')

test.28 <- readDF('data/test_28.csv')
test.14 <- readDF('data/test_14.csv')
test.7 <- readDF('data/test_7.csv')

train.list <- c("train.28", "train.14", "train.7")
test.list <- c("test.28", "test.14", "test.7")

#head(train.28)
#head(train.14)
#head(train.7)


fileConn<-file("output.txt")
writeLines(list('a',0,0,0,0), fileConn)
close(fileConn)


write.csv( list('a',0,0,0,0), file = "output.csv", append = T)


 ls()
#[1] "mod"
 saveRDS(mod, "mymodel.rds")
 mod2 <- readRDS("mymodel.rds")
 ls()
#[1] "mod"  "mod2"
 identical(mod, mod2, ignore.environment = TRUE)
#[1] TRUE

 
 (z <- Sys.time() - 3600)
 Sys.time() - z                # just over 3600 seconds.
 
 ## time interval between release days of R 1.2.2 and 1.2.3.
 ISOdate(2001, 4, 26) - ISOdate(2001, 2, 26)
 
 as.difftime(c("0:3:20", "11:23:15"))
 as.difftime(c("3:20", "23:15", "2:"), format = "%H:%M") # 3rd gives NA
 (z <- as.difftime(c(0,30,60), units = "mins"))
 as.numeric(z, units = "secs")
 as.numeric(z, units = "hours")
 format(z)
 
 time1 - time2
 
 difftime(time1, time2, tz,
          units = c("auto", "secs", "mins", "hours",
                    "days", "weeks"))
 
 as.difftime(tim, format = "%X", units = "auto")

"knn  training time: 
1.00602728976144


