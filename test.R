install.packages("dplyr")
install.packages("ggplot2")
install.packages("ggthemes")

library(dplyr)
library(ggplot2)
library(ggthemes)

DF <- read.csv("example_population_f.csv")
DF <- DF[,1]
DF <-tbl_df(DF)
DF
