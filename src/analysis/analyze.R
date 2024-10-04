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

#Drama regression
lmDrama <- lm(averageRating ~ DDrama*`30-60 min` + DDrama*`60-90 min` + DDrama*`90-120 min` + DDrama*`120-150 min` + DDrama*`150-180 min` + DDrama*`>180 min`, movies)
summary(lmDrama)

#Action regression
lmAction <- lm(averageRating ~ DAction*`30-60 min` + DAction*`60-90 min` + DAction*`90-120 min` + DAction*`120-150 min` + DAction*`150-180 min` + DAction*`>180 min`, movies)
summary(lmAction)

#Comedy regression
lmComedy <- lm(averageRating ~ DComedy*`30-60 min` + DComedy*`60-90 min` + DComedy*`90-120 min` + DComedy*`120-150 min` + DComedy*`150-180 min` + DComedy*`>180 min`, movies)
summary(lmComedy)

#Adventure regression
lmAdventure <- lm(averageRating ~ DAdventure*`30-60 min` + DAdventure*`60-90 min` + DAdventure*`90-120 min` + DAdventure*`120-150 min` + DAdventure*`150-180 min` + DAdventure*`>180 min`, movies)
summary(lmAdventure)

#Crime regression
lmCrime <- lm(averageRating ~ DCrime*`30-60 min` + DCrime*`60-90 min` + DCrime*`90-120 min` + DCrime*`120-150 min` + DCrime*`150-180 min` + DCrime*`>180 min`, movies)
summary(lmCrime)

