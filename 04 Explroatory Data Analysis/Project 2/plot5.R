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

#How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
sub3 <- subset(summary, fips == "24510" & type=="ON-ROAD")
q4<- aggregate(sub3[c("Emissions")], list(type = sub3$type, year = sub3$year, zip = sub3$fips), sum)

png("plot5.png")
qplot(year, Emissions, data = q4, geom= c("point", "smooth"), method = "lm") + theme_gray() + ggtitle("Motor Vehicle Related Emissions in Baltimore") + xlab("Year") + ylab("Emissions")
dev.off()