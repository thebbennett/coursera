complete <- function(directory, id = 1:332){
  setwd(directory)
  files <- list.files()
  
  df_total <- data.frame()  
  for (i in id){
    data <- read.csv(files[i])
    x <- complete.cases(data)
    x <- length(x[x==TRUE])
    df_total <- rbind(df_total, x)
  }
  df_total
}
