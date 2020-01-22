## 상관관계와 회귀분석


### 1. 상관분석(correlation analysis)
 -->  변수들이 서로 얼마나 밀집하게 직선적인 관게를 가지고 있는지를 분석하는 통계기법
```
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

![image](https://user-images.githubusercontent.com/47058441/72765626-a73b4e80-3c30-11ea-936f-d9a3c52fea27.png)

![image](https://user-images.githubusercontent.com/47058441/72765644-c3d78680-3c30-11ea-8675-b7a14fd17432.png)




### 2. 회귀분석(regression analysis)
  --> 한 개 또는 그 이상의 변수들(독립변수)에 대하여 다른 한 변수(종속변수) 사이의 관계를 수학적인 모형을 이용하여 설명하고 예측하는 분석기법
#### torque~angle  
```
install.packages("readxl")
library(readxl)

TAS<-readxl::read_excel(path="TAS.xlsx",
                        sheet="Sheet1",
                        col_names = TRUE)
TAS

m1<-lm(torque~angle)
plot(torque~angle)
abline(m1, col="red")

summary(m1)

m2<-lm(torque~angle+`2slope`)
summary(m2)

plot(m2)
```
#### angle~torque
```
install.packages("readxl")
install.packages("ggplot2")
library(readxl)

TAS<-readxl::read_excel(path="TAS.xlsx",
                        sheet="Sheet1",
                        col_names = TRUE)

TAS
head(TAS)
length(TAS$torque)


m4<-lm(data=TAS,`angle`~`torque`+I(torque^2))
summary(m4)

scatter.smooth(x=TAS$torque,y=TAS$angle,col="red")

tor<-data.frame(torque=c(3.4))
predict(m4,tor,interval="confidence")

plot(m4)

```
```
Call:
lm(formula = angle ~ torque + I(torque^2), data = TAS)

Residuals:
   Min     1Q Median     3Q    Max 
-78.65 -30.97  11.30  19.78 126.32 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  196.169      7.242  27.088   <2e-16 ***
torque      -103.398      7.727 -13.381   <2e-16 ***
I(torque^2)   17.646      1.919   9.194   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 34.79 on 251 degrees of freedom
Multiple R-squared:  0.5697,	Adjusted R-squared:  0.5663 
F-statistic: 166.2 on 2 and 251 DF,  p-value: < 2.2e-16
```
![image](https://user-images.githubusercontent.com/47058441/72855988-9eb04a00-3cfc-11ea-91d2-06ec0cf33955.png)
