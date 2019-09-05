install.packages("jsonlite")
install.packages("curl")
library(jsonlite)

dop <- fromJSON("https://blocklocation.mybluemix.net/dop/readDB")
str(dop)
dop

date <- dop$timestamp>="9/1/2019" & dop$timestamp<"9/2/2019"
date

date1<- dop[dop$timestamp<="8/31/2019",]
date1
nrow(date1)
nrow(dop[dop$timestamp<="8/31/2019",])

date2<- dop[dop$timestamp>="9/1/2019" & dop$timestamp<"9/2/2019",]
date2
nrow(date2)
nrow(dop[dop$timestamp>="9/1/2019" & dop$timestamp<"9/2/2019",])

date3<- dop[dop$timestamp>="9/2/2019" & dop$timestamp<"9/3/2019",]
date3
nrow(date3)

range(timestamp())

con <- ifelse(data1,"A")


head(dop,10)

install.packages("stringr")
library(stringr)
temp <- str_split_fixed(dop[,1],"\\,",2)
head(temp)

colnames(temp) <- c("Date","Time")
dop <-data.frame(temp,dop[c(2:3)])
head(dop,13)

propopul <- tapply(dop$longitude, dop$Date,sum)
propopul


table(dop$Date)


library("ggplot2")
qplot(Date,data=dop,geom="bar")
