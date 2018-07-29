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

#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
#from 1999 to 2008? Use the base plotting system to make a plot answering this question.

sub2 <- subset(summary, fips == "24510")
sub2 <- subset(sub2, year >= 1999 | year <= 2008 )
q2 <- sub2 %>% 
  group_by(year) %>% 
  summarise(Total = sum(Emissions))

png("plot2.png")
with(q2, plot(year, Total, col = "red", pch = 9))
title(main = "Total Emissions in Baltimore City, Maryland,  by Year from 1999 to 2008")
model <- lm(Total ~ year, q2)
abline(model, lwd=2)
dev.off()
