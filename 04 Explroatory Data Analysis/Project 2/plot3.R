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


#Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) 
#variable, which of these four sources have seen decreases in emissions from 1999-2008 
#for Baltimore City? Which have seen increases in emissions from 1999-2008? 
#Use the ggplot2 plotting system to make a plot answer this question.
sub2 <- subset(summary, fips == "24510")
sub2 <- subset(sub2, year >= 1999 | year <= 2008 )
q2 <- sub2 %>% 
  group_by(year) %>% 
  summarise(Total = sum(Emissions))

png("plot3.png")
qplot(year, Emissions, data = sub2, ,	geom	=	c("point",	"smooth"), method = "lm", facets = .~type)
dev.off()