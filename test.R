install.packages("dplyr")
install.packages("ggplot2")
install.packages("ggthemes")

library("dplyr")
library("ggplot2")
library("ggthemes")

DF <- read.csv("example_population_f.csv")
DF <- DF[,-1]
DF <- tbl_df(DF)
DF

DF2 <- filter(DF,Provinces=="충청북도"|Provinces=="충청남도")
DF2

Graph <- ggplot(DF2, aes(x=City, y=Population,fill=Provinces)) + geom_bar(stat="identity") + theme_wsj()
Graph

GraphReorder <- ggplot(DF2, aes(x=reorder(City, Population), y=Population, fill=Provinces))+geom_bar(stat="identity")+theme_wsj()
GraphReorder

DF3<-filter(DF,SexRatio>1,PersInHou<2)
Graph <- ggplot(DF3,aes(City,y=SexRatio,fill=Provinces))+geom_bar(stat="identity") + theme_wsj()
Graph


