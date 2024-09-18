# cleaning the data
# downloading the packages 
library(dplyr)
library(readr)

# Downloading the dataset 
movies <- read_csv("merged_movies.csv")

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

# This boxplot shows how the runtime in Minutes of all the movies have been distributed.
# This boxplot does not give a lot of insights because of this we decided to remove the outliers in the dataset.
boxplot(movies$runtimeMinutes,
        main = "Boxplot of the runtime of movies",
        ylab = "Runtime in minutes")

# Making cutoff for runtimeMinutes 
sd_runtimeMinutes <- sd(movies$runtimeMinutes)
mean_runtimeMinutes <- mean(movies$runtimeMinutes)
outliers_runtimeMinutes <- mean_runtimeMinutes + 3 * sd_runtimeMinutes

movies <- movies %>% filter(movies$runtimeMinutes <= outliers_runtimeMinutes)

# removing genre == NA 
sum(is.na(movies$genres))
movies <- movies %>% filter(!is.na(movies$genres))

# Writing data set to file 
write_csv(movies, "movies.csv")


