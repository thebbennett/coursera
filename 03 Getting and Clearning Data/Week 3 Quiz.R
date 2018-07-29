url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
data <- read.csv(url)

####


##logical variable

#households greater than 10 acres AND sold 10k 
# acres: ACR
# sales AGS,
# more than 10k <- AGS == 6

agricultureLogical <- (data$ACR == 3 & data$AGS == 6)
which(agricultureLogical)


#########################
### Question 2
library(jpeg)
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg" 
download.file(url, destfile = "week3img.jpeg")
img2 <- readJPEG("week3img.jpeg", native = TRUE)

#30 and 80th quantiles
quantile(img2, probs = c(0.3, 0.8), na.rm = TRUE)

#####################
## Question 3 

##Match the data based on the country shortcode. 
##How many of the IDs match? Sort the data frame in 
##descending order by GDP rank (so United States is last). 
##What is the 13th country in the resulting data frame?


## country code edu
## X gdp
url1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
url2 <-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"

gdp <- read.csv(url1, stringsAsFactors = FALSE)
edu <- read.csv(url2)


names(gdp) <- c("CountryCode", "gdp", "1", "2", "3", "4", "5", "6", "7", "8") 
gdp$gdp <- as.numeric(gdp$gdp)

gdp2 <- filter(gdp, gdp >= 1)

take1 <- merge(gdp2, edu, by = "CountryCode")
take2 <- arrange(take1, desc(gdp))

# match <- 224

#######################
## Question 4 
## by Income.Group

take2 %>%
  group_by(Income.Group) %>%
  summarise(avg_income = mean(gdp))

#####################
##Question 5 

## Make a table versus Income.Group. How many countries are Lower middle income but among the 38 nations with highest GDP?
take2 %>%
  mutate(gdp = cut(gdp, breaks = quantile(gdp, probs = seq(0,1,0.2))))

q5 <- filter(take2, Income.Group == "Lower middle income", gdp <= 38)




