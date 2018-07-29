# Week 1 Course Project
# Author: Brittany Bennett
# October 20, 2017


#file <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#download.file(file, dest = "data.zip")
#unzip("data.zip")

#data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", stringsAsFactors = FALSE)
test <- data
# Cleans the data to have numeric columns
test$Global_active_power <- as.numeric(data$Global_active_power)
test$Date <- as.Date(test$Date, "%d/%m/%Y" )

library("dplyr")
Date1 <- as.Date("2007-02-01")
Date2 <- as.Date("2007-02-02")

subset <- test[test$Date >= Date1 & test$Date <=Date2,]

#Construct the plot and save it to a PNG file 
#with a width of 480 pixels and a height of 480 pixels.

# Construct Plot 1
library(scales)
par(mfrow=c(1,1))
plot1 <- hist(subset$Global_active_power, 
              col = "red", 
              breaks = 16, 
              main = 'Global Reactive Power', 
              xlab = "Global Active Power (kilowatts)", 
              ylab = "Frequency", 
              xlim = c(0, max(8)))
              



#Name each of the plot files as plot1.png, plot2.png, etc.


#Create a separate R code file (plot1.R, plot2.R, etc.) 
#that constructs the corresponding plot, i.e. code in plot1.R 
# constructs the plot1.png plot. 
# Your code file should include code for reading the data 
#so that the plot can be fully reproduced. 
#You must also include the code that creates the PNG file.



#Add the PNG file and R code file to the top-level folder 
#of your git repository (no need for separate sub-folders)
