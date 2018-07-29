## final Course Project
## Coursera: Exploratory Data Analysis



## Set Working Directory
setwd("~/Coursera Data Science/04 Explroatory Data Analysis")


## File URL
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(fileUrl, destfile="./pm.zip")

fname = unzip("./pm.zip", list = TRUE)
unzip("./pm.zip", files = NULL, list = FALSE, overwrite = TRUE,
      junkpaths = FALSE, exdir = "./data", unzip = "internal",
      setTimes = FALSE)

setwd("~/Coursera Data Science/04 Explroatory Data Analysis/data")

code <- readRDS("Source_Classification_Code.rds")
summary <- readRDS("summarySCC_PM25.rds")

library(ggplot2)
library(dplyr)

##################################################################


#Across the United States, how have emissions from coal combustion-related sources 
#changed from 1999-2008?
scc <- code[grepl("Coal" , code$Short.Name), ]
nei <- summary[summary$SCC %in% scc$SCC, ]

png("plot4.png")
q4 <- ggplot(nei, aes( x = factor(year), y = Emissions, fill = type))+ geom_bar(stat = "identity", width = 0.4) +xlab("year")+ ylab ("PM 2.5 Emissions From Coal Emitting Sources)") + ggtitle("Total Emissions from Coal Related Sources from 1999 to 2008")
print(q4)
dev.off()
