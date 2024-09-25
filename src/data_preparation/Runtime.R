library(tidyverse)
movies <- read_csv('movies.csv')


#rating x runtime
#rating x genre
#genre x runtime

runtimes <- c("<30 min", "30-60 min", "60-90 min", "90-120 min", "120-150 min", "150-180 min", ">180 min")

movies <- movies %>% mutate("0-30 min" = movies$runtimeMinutes <=30) %>%
  mutate("30-60 min"= movies$runtimeMinutes >30 & movies$runtimeMinutes<=60) %>%
  mutate("60-90 min"= movies$runtimeMinutes >60 & movies$runtimeMinutes<=90) %>%
  mutate("90-120 min"= movies$runtimeMinutes >90 & movies$runtimeMinutes<=120) %>%
  mutate("120-150 min"= movies$runtimeMinutes >120 & movies$runtimeMinutes<=150) %>%
  mutate("150-180 min"= movies$runtimeMinutes >150 & movies$runtimeMinutes<=180) %>%
  mutate(">180 min"= movies$runtimeMinutes >180)



table(movies1$`0-30 min`)
table(movies1$`30-60 min`)
table(movies1$`60-90 min`)
table(movies1$`90-120 min`)
table(movies1$`120-150 min`)
table(movies1$`150-180 min`)
table(movies1$`>180 min`)
