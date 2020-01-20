## 상관관계와 회귀분석


### 1. 상관분석(correlation analysis)
````
install.packages("readxl")
library(readxl)
// 엑셀 파일을 받아옴
TAS<-readxl::read_excel(path="TAS.xlsx",
                        sheet="Sheet1",
                        col_names = TRUE)
TAS
str(TAS)
colSums(is.na(TAS))
attach(TAS)
plot(torque~angle,col="red")

cov(torque,angle)    // 공분산
cor(torque,angle, use='complete.obs',method='pearson')    // 함수를 통한 두 변수간 선형관계 강도 
cor.test(torque,angle)    // 상관계수 검정

plot(TAS[,1:9])    // 산점도 확인
install.packages("corrplot")
library(corrplot)
x<-cor(TAS[,1:9])
corrplot(x)



```
