DF <- read.csv("example_population.csv", stringsAsFactors = F)
str(DF)
head(DF,5)

install.packages("stringr")
library(stringr)

temp <- str_split_fixed(DF[,1],"\\(",2) # '('를 기준으로 나눠서 앞 문자열만 사용
head(temp,10)

NewCity <- str_split_fixed(temp[,1], " ",2) # 공백을 기준으로 '시(City)'와 '구'를 나눕니다.
head(NewCity)

colnames(NewCity)<- c("Provinces", "City") # 변수이름을 바꿔줍니다.
DF <- data.frame(NewCity, DF[,(2:7)]) #작업한 변수들을 합칩니다.
head(DF,3)

DF[DF ==" "] <- NA # City 값 중 빈 곳을 NA로 바꿉니다.
head(DF,10)

DF <-DF[complete.cases(DF),] # NA가 있는 행을 삭제합니다.
head(DF,10)

for( i in 3:8){ # 문자열 변수를 수치형 변수로 변경
  DF[,i] <- sapply(DF[,i], function(x) gsub(",","",x))
  DF[,i] <- as.numeric(DF[,i])
}
str(DF)

ProPopul <- tapply(DF$Population, DF$Provinces, sum)
ProPopul

DF[,1] <- factor(DF[,1])
ProPopul <- tapply(DF$Population, DF$Provinces, sum)
ProPopul
library(ggplot2)
library(ggthemes)
Graph <- ggplot(DF, aes(x=Provinces, y=Population, fill= Provinces))+ geom_bar(stat="identity")+theme_wsj()
Graph
