# cleaning the data
# downloading the packages 
library(dplyr)
library(readr)

# Downloading the dataset 
movies <- read_csv("movies.csv")

# See how many NA's we have for runtimeMinutes
sum(is.na(movies$runtimeMinutes))

# Getting rid of the NAs for runtimeMinutes
movies <- movies %>% filter(!is.na(movies$runtimeMinutes))

# Seeing what kind of movies type we have 
table(movies$titleType)

# Filtering to only get the movies
movies <- movies %>% filter(movies$titleType == "movie")

# Removing the column endYear, as it only contains NAs and originalTitle as it is not of use
movies <- movies %>% 
  select(-endYear) %>%
  select(-originalTitle)

# making cutoff for numVotes
mean_votes <- mean(movies$numVotes)

movies <- movies %>% 
  filter(movies$numVotes >= 30)

# making cutoff for runtimeMinutes 
movies <- movies %>%
  filter(runtimeMinutes >= 60 & runtimeMinutes <= 240)







