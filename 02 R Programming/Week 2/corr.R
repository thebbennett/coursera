corr <- function(directory = "specdata", threshold = 300) {
  files <- list.files()
  
  df_total <- data.frame()  
  for (i in 1:332){
    data <- read.csv(files[i])
    x <- complete.cases(data)
    x <- length(x[x==TRUE])
    df_total <- rbind(df_total, x)
  }
  
  locations <- which(df_total$X117L > threshold)
  
  answer <- c()
  for (i in 1:length(locations)){
    data2 <- read.csv(files[locations[i]])
    t <- subset(data2, (!is.na(data2$sulfate)) & (!is.na(data2$nitrate)))
    s <- t$sulfate
    n <- t$nitrate
    correlation <- cor(s,n)
    answer <- c(answer, correlation)
  }
  answer

}