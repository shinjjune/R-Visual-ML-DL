library(dplyr)
library(ggplot2)
library(ggthemes)
library(reshape2)
library(scales)

DF<-read.csv("example_population2.csv")
DF <- tbl_df(DF)
DF
group <- group_by(DF,Time)
DF2<-summarise(group, s0=sum(age0to4,age5to9),
                s10=sum(age10to14,age15to19),
                s20=sum(age20to24,age25to29),
                s30=sum(age30to34,age35to39),            
                s40=sum(age40to44,age45to49),
                s50=sum(age50to54,age55to59),
                s60=sum(age60to64,age65to69),
                s70=sum(age70to74,age75to79),
                s80=sum(age80to84,age85to89),              
                s90=sum(age90to94,age95to99),
                s100=sum(age100to104,age105to109))
haed(DF2,5)               
head(DF2,5)               
DF3 <- melt(DF2, id.vas="Time",measure.vars=c("s0","s10","s20","s30","s40","s50","s60","s70","s80","s90","s100"))
colnames(DF3) <- c("Time","Generation","Population")            

G1 <- ggplot(DF3, aes(x=Time, y=Population, color=Generation, fill=Generation))+ geom_area(alpha=.6)+theme_wsj()
G1

G2 <- ggplot(DF3, aes(x=Time,y=Population,color=Generation,fill=Generation))+ geom_area(alpha=.6)+theme_wsj()
G2+ scale_y_continuous(labels=comma)
