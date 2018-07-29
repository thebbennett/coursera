setwd("~/Coursera Data Science/R Programming/Week 4/rprog%2Fdata%2FProgAssignment3-data")## Check that state and outcome are valid

best <- function(state, outcome){
  ##Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  
  
  ## Check that state and outcome are valid
  if(!(state %in% data$State)) {
    stop("invalid state")
  }
  if (!(outcome %in% c("heart attack", 
        "heart failure","pneumonia"))){
    stop("invalid outcome")
  }
  
  if (outcome == "heart attack"){
    col <- 11
  } else if(outcome == "heart failure"){
    col <- 17
  } else if(outcome == "pneumonia"){
    col <-23
  }
  
  data[, col] <- as.numeric(data[, col])
  
  
  ## Return hospital name in that state with lowest 30-day death rate
  subset <- data[data$State == state,]
  row <- which(subset[,col] == min(subset[,col], na.rm = TRUE))
  name <- subset[row, "Hospital.Name"]
  name
}

rankhospital <- function(state, outcome, num){
  ##Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ## Check that state and outcome are valid
  if(!(state %in% data$State)) {
    stop("invalid state")
  }
  if (!(outcome %in% c("heart attack", 
                       "heart failure","pneumonia"))){
    stop("invalid outcome")
  }
  
  if (outcome == "heart attack"){
    col <- 11
  } else if(outcome == "heart failure"){
    col <- 17
  } else if(outcome == "pneumonia"){
    col <-23
  }
  
  ## Return hospital name in that state with the given rank
  subset <- data[data$State == state,]
  input <- subset[,col]
  rank <- rank(input)
  if (num == "worst"){
    num <- max(rank)
  } else if (num == "best"){
    num <- 1
  }
  ordered <- order(rank)
  row <- ordered[num]
  
  #row <- which(rank == num)
  name <-
    subset[row, "Hospital.Name"]
  name
}




rankall <- function(outcome, num){
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  data[, 11] <- as.numeric(data[, 11])
  
  ## Check that state and outcome are valid
  if (!(outcome %in% c("heart attack", 
                       "heart failure","pneumonia"))){
    stop("invalid outcome")
  }
  
  
  ## For each state, find the hospital of the given rank
  states <- unique(data[,"State"])
  df <- data.frame(matrix(ncol = 2, nrow= 1))
  
  for (i in 1:length(states)){
    subset <- data[data$State == states[i],]
    rank <- rank(subset$Hospital.Name)
    row <- which(rank == num)
    name <- as.character(subset[row, "Hospital.Name"])
    result <- c(name, states[i])
    df <- rbind(df, result)
  }
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  df
  
  
}
  
  