DF <- read.csv("example_salary.csv",stringsAsFactors=F, na="-")
head(DF,5)

colnames(DF) <- c("age","salary","specialSalary","workingTime","numberOfWorker","career","sex")
Scale <- scale(DF$salary)
head(Scale, 10)

DF<-cbind(DF,scale =Scale)
str(DF)

g1 <- ggplot(DF,aes(x=scale, y=age))
g2 <- geom_segment(aes(yend=age),xend=0)
g3 <- g1+g2+geom_point(size=7, aes(color=sex, shape=career))+theme_minimal()
g3
