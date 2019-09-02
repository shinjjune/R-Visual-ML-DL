install.packages("data.table")
library("data.table")
library("ggplot2")

DF <- fread("example_coffee.csv",header=T, stringsAsFactors = T, data.table=F)
str(DF)
DF <- subset(DF, select=c(-adress, -adressBystreet, -dateOfclosure, -startdateOfcessation, -duedateOfcessation, -dateOfreOpen, -zip))
str(DF)
DF
range(DF$yearOfStart, na.rm=T)

subset(DF, subset=(yearOfStart==1964))
DFFilter <- subset(DF,subset=(stateOfbusiness=="운영중"))
range(DFFilter$yearOfStart, na.rm=T)
subset(DFFilter, subset=(yearOfStart==1967))
table(DF$yearOfStart)
qplot(yearOfStart, data=DF, geom="bar")

Freq <- table(DF$stateOfbusiness, DF$yearOfStart)
Freq
which(colnames(Freq)=="1997")
which.max(colnames(Freq))
Freq<-Freq[,c(30:47)]
Freq

PFreq <- prop.table(Freq, margin=2)
PFreq

NewDF <- data.frame(colnames(Freq), Freq[1,], Freq[2,],PFreq[1,], PFreq[2,])
NewDF

rownames(NewDF) <- NULL
colnames(NewDF) <- c("Time","Open","Close","POpen","PClose")
NewDF


ggplot(NewDF,aes(x=factor(Time), y=Close, group=1))+
  geom_line(color="steelblue1", size=1)+
  geom_point(color="steelblue",size=3)+
  geom_line(aes(y=Open), color="tomato2",size=1)+
  geom_point(aes(y=Open), color="red", size=3)+theme_bw()
