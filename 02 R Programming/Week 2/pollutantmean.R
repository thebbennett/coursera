pollutantmean <- function(directory = "specdata", pollutant = "sulfate", id= 1:332){
  setwd(directory)
  files <- list.files()
  df_total <- c()
  for (i in id){
    data <- read.csv(files[i])
    x <- data[,pollutant]
    df_total <- c(df_total, x)
  }
  mean(df_total, na.rm = TRUE)
}
