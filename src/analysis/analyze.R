# Load packages 
library(tidyverse)
library(ggplot2)

# Importing the data set 
movies <- read_csv("../../gen/data-preparation/output/movies.csv")

# analyzing the data 
# Simple regression
lm1 <- lm(averageRating ~ runtimeMinutes, movies)
summary(lm1)

ggplot(movies, aes(x=runtimeMinutes, y=averageRating)) +
  geom_point()
geom_smooth(method = "lm", se=FALSE)

# The dummy '0-30 min' is used as standard here to avoid strict multicollinearity
lm2<- lm(averageRating ~ `30-60 min` + `60-90 min` + `90-120 min` + `120-150 min` + `150-180 min` + `>180 min`, movies)
summary(lm2)

# Regressing the runtime against the top 5 genres
lm3 <- lm(averageRating ~ runtimeMinutes + runtimeMinutes*DDrama + runtimeMinutes*DAction + runtimeMinutes*DComedy + runtimeMinutes*DAdventure + runtimeMinutes*DCrime, movies)
summary(lm3)
