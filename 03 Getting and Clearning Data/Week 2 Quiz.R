library(httr)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. To make your own application, register at 
#    https://github.com/settings/developers. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
#    Replace your key and secret below.
myapp <- oauth_app("github",
                   key = "14c77065e58186263971",
                   secret = "d0931ee4c9dc6bd68e5f18622002faa6b5351ff6")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)

library(jsonlite)
json1 <- content(req)
json2 = jsonlite::fromJSON(toJSON(json1))
json2[1,"created_at"]
json2[json2$name == "datasharing","created_at"]


############################
##Question 2
install.packages("sqldf")
library(sqldf)

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
acs <- read.csv(url )

sqldf("select pwgtp1 from acs where AGEP < 50")

unique(acs$AGEP)
sqldf("slect ")

#########################
##Question 3

con <- url("http://biostat.jhsph.edu/~jleek/contact.html")
library("httr")
 html = readLines(con)
nchar(html[30])

####################
##Question 5

con <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
x <- read.fwf(con, widths = c(2,2,2,2,2,2,2,2,2))
sum(x[,4])
