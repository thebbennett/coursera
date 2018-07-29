##Question 1
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileurl, destfile = "data.csv")

data <- read.csv("data.csv")
value <- subset(data, VAL == 24)
length(value$VAL)


##Question 3

library(xlsx)
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileurl, destfile = "natgas.csv", method = "curl")
dat <- read.xlsx("natgas.csv",sheetIndex = 1, rowIndex = 18:23, colIndex = 7:15, header = T)

sum(dat$Zip*dat$Ext,na.rm=T)

##Question 4
library(XML)
url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"

doc <- xmlTreeParse(url, useInternal=TRUE)
rootNode <- xmlRoot(doc) #wrapper element for the entire 
xmlName(rootNode)
names(rootNode) #what all the nested elements are 

list <- xpathSApply(rootNode, "//zipcode", xmlValue)
list <- subset(list, list == 21231)
length(list)

##Question 5l
library(data.table)
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
DT<- fread(fileurl)


