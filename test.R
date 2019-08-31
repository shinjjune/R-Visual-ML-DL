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


![image](https://user-images.githubusercontent.com/47058441/64065628-c23dff80-cc4a-11e9-9cc5-75d6a6c693b8.png)
