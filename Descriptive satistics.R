DF<- read.csv("example_salary.csv", stringsAsFactors = F, na="-")
head(DF,5)

colnames(DF)
colnames(DF) <- c("age","salary","specialSalry","workingTime","numberOfWorker","career","sex")
temp <- tapply(DF$salary, DF$sex, mean, na.rm=T) # tapply() '첫 번째 인자를 두 번째인자를 기준으로 세 번째 인자인 함수로 처리'
temp

library("reshape2")
library("ggplot2")
melt <- melt(temp)
ggplot(melt, aes(x=Var1, y=value, fill=Var1))+ geom_bar(stat="identity")

tapply(DF$salary, DF$sex, range, na.rm=T)

temp <- tapply(DF$salary, DF$career, mean, na.rm=T)
temp

melt<-melt(temp)
ggplot(melt, aes(x=Var1, y=value, group=1))+
  geom_line(color="skyblue2", size=2) + coord_polar()+
  ylim(0,max(melt$value))
