# Load packages 
library(dplyr)
library(stringr)
library(tidyverse)
library(scales)

# Importing the data set 
movies <- read_csv("../../gen/data-preparation/temp/movies_cleaned.csv")

# Making a list of all different genres retrieved from IMDB's website
genres <- c("Action", "Adventure", "Animation", "Biography", "Comedy", "Crime", "Documentary", "Drama", "Family", "Fantasy", "Film-Noir", "Game-Show", "History", "Horror", "Music", "Musical", "Mystery", "News", "Reality-TV", "Romance", "Sci-Fi", "Short", "Sport", "Talk-Show", "Thriller", "War", "Western")

# Writing a loop to create a dummy variable for each specific genre
for (genre in genres) {
  genre_col <- paste0("D", genre)
  movies <- movies %>%
    mutate(!!genre_col := as.integer(str_detect(genres, genre)))
}

# Creating a summary that shows us the number of each genre present in the dataset
dummy_cols <- movies %>% select(starts_with("D"))
genre_summary <- colSums(dummy_cols)
genre_summary

# Getting rid of the DShort column as it has zero entries
movies <- movies %>% select(-DShort)

# Creating a dataframe of the genre of movies
genre_data <- data.frame(Genre = names(genre_summary), Count = genre_summary)

# Creating dummy variables for runtime
movies <- movies %>% mutate("0-30 min" = movies$runtimeMinutes <=30) %>%
  mutate("30-60 min"= movies$runtimeMinutes >30 & movies$runtimeMinutes<=60) %>%
  mutate("60-90 min"= movies$runtimeMinutes >60 & movies$runtimeMinutes<=90) %>%
  mutate("90-120 min"= movies$runtimeMinutes >90 & movies$runtimeMinutes<=120) %>%
  mutate("120-150 min"= movies$runtimeMinutes >120 & movies$runtimeMinutes<=150) %>%
  mutate("150-180 min"= movies$runtimeMinutes >150 & movies$runtimeMinutes<=180) %>%
  mutate(">180 min"= movies$runtimeMinutes >180)

write_csv(movies, "../../gen/data-preparation/output/movies.csv")

