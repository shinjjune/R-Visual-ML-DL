install.packages("hflights")
library("hflights")
hflights

str(hflights)
CountOfDest <- table(hflights$Dest)
CountOfDest
length(CountOfDest)
range(CountOfDest)
CountOfDest[CountOfDest == 1]
CountOfDest[CountOfDest == 9820]
SelectedDest <- CountOfDest[CountOfDest >5500]
SelectedDest

addmargins(SelectedDest, margin=1)

barplot(SelectedDest)
