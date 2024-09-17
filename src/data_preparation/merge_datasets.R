library(dplyr)
library(tidyverse)

basics <- read_csv("basics.csv")
ratings <- read_csv("ratings.csv")

movies <- merge(basics, ratings)

write_csv(movies, "movies.csv")
