library("ggplot2")
str(diamonds)

library("ggplot2")
library("ggthemes")

ggplot(diamonds, aes(x=x, y=price, color=clarity)) +geom_point(alpha=0.03)+
  geom_hline(yintercept=mean(diamonds$price), color="turquoise3",alpha=.8)+
  guides(color=guide_legend(override.aes=list(alpha=1)))+
  xlim(3,9)+theme_solarized_2()
