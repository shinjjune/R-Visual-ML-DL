install.packages("jsonlite")
library(jsonlite)
df_repos <- fromJSON("https://api.github.com/users/hadley/repos")

str(df_repos)

names(df_repos$owner)


df_repos[1:3,]$owner$login
df_repos[1:3,"owner"]$login
df_repos$owner[1:3,"login"]
df_repos$owner[1:3,]$login

head(df_repos)

