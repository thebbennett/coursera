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

##Plots
#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#Using the base plotting system, make a plot showing the total PM2.5 emission from 
#all sources for each of the years 1999, 2002, 2005, and 2008.

sub <- subset(summary, year >= 1999 | year <= 2008 )
q1 <- sub %>% 
  group_by(year) %>% 
  summarise(Total = sum(Emissions))


with(q1, plot(year, Total, col = "red", pch = 9))
title(main = "Total Emissions by Year from 1999 to 2008")
model <- lm(Total ~ year, q1)
abline(model, lwd=2)

#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
#from 1999 to 2008? Use the base plotting system to make a plot answering this question.

sub2 <- subset(summary, fips == "24510")
sub2 <- subset(sub2, year >= 1999 | year <= 2008 )
q2 <- sub2 %>% 
  group_by(year) %>% 
  summarise(Total = sum(Emissions))

with(q2, plot(year, Total, col = "red", pch = 9))
title(main = "Total Emissions in Baltimore City, Maryland,  by Year from 1999 to 2008")
model <- lm(Total ~ year, q2)
abline(model, lwd=2)



#Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) 
#variable, which of these four sources have seen decreases in emissions from 1999-2008 
#for Baltimore City? Which have seen increases in emissions from 1999-2008? 
#Use the ggplot2 plotting system to make a plot answer this question.
qplot(year, Emissions, data = sub2, ,	geom	=	c("point",	"smooth"), method = "lm", facets = .~type)


#Across the United States, how have emissions from coal combustion-related sources 
#changed from 1999-2008?
scc <- code[grepl("Coal" , code$Short.Name), ]
nei <- summary[summary$SCC %in% scc$SCC, ]

q4 <- ggplot(nei, aes( x = factor(year), y = Emissions, fill = type))+ geom_bar(stat = "identity", width = 0.4) +xlab("year")+ ylab ("PM 2.5 Emissions From Coal Emitting Sources)") + ggtitle("Total Emissions from Coal Related Sources from 1999 to 2008")
print(q4)

#How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
sub3 <- subset(summary, fips == "24510" & type=="ON-ROAD")
q4<- aggregate(sub3[c("Emissions")], list(type = sub3$type, year = sub3$year, zip = sub3$fips), sum)
qplot(year, Emissions, data = q4, geom= c("point", "smooth"), method = "lm") + theme_gray() + ggtitle("Motor Vehicle Related Emissions in Baltimore") + xlab("Year") + ylab("Emissions")

#Compare emissions from motor vehicle sources in Baltimore City with emissions from 
#motor vehicle sources in Los Angeles County, California (fips == "06037"). 
#Which city has seen greater changes over time in motor vehicle emissions?
sub4 <- subset(summary, fips == "06037" & type=="ON-ROAD")
q5<- aggregate(sub4[c("Emissions")], list(type = sub4$type, year = sub4$year, zip = sub4$fips), sum)

finaldata <- rbind(q4, q5)

qplot(year, Emissions, data = finaldata, color = zip, geom = c("point", "smooth"), method = "lm") + ggtitle("Motor Vehicle Emissions in Baltimore (24510) \nvs. Los Angeles (06037) Counties") + xlab("Year") + ylab("Emission Levels")             