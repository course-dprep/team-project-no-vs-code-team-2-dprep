# Load packages
library(dplyr)
library(readr)

# DATA CLEANING 

# Read the merged dataset from the 'temp' directory
movies <- read_csv("../../gen/data-preparation/temp/merged_movies.csv")

# Check how many missing values (NA) are present in the 'runtimeMinutes' column
sum(is.na(movies$runtimeMinutes))

# Remove rows where 'runtimeMinutes' has missing values
movies <- movies %>% filter(!is.na(movies$runtimeMinutes))

# Display the count of different types of titles (movies, shorts, TV shows, etc.)
table(movies$titleType)

# Filter the dataset to only include rows where 'titleType' is "movie"
movies <- movies %>% filter(movies$titleType == "movie")

# Remove the 'endYear' column, as it only contains missing values (NAs)
# Also remove 'originalTitle' and 'isAdult' column, as it's not needed for the analysis
movies <- movies %>% 
  select(-endYear) %>%
  select(-originalTitle) %>%
  select(-isAdult)

# Create a boxplot to visualize the distribution of 'runtimeMinutes' for all movies
# Note: The boxplot will give an insights in the outliers 
boxplot(movies$runtimeMinutes,
        main = "Boxplot of the runtime of movies",
        ylab = "Runtime in minutes")

# Calculate the standard deviation and mean for 'runtimeMinutes' to define an outlier cutoff 
sd_runtimeMinutes <- sd(movies$runtimeMinutes)
mean_runtimeMinutes <- mean(movies$runtimeMinutes)
outliers_runtimeMinutes <- mean_runtimeMinutes + 3 * sd_runtimeMinutes

# Filter the dataset to remove outliers, keeping only movies with runtime <= 3 standard deviations above the mean
movies <- movies %>% filter(movies$runtimeMinutes <= outliers_runtimeMinutes)

# Check for missing values (NA) in the 'genres' column
sum(is.na(movies$genres))

# Remove rows where 'genres' is missing (NA)
movies <- movies %>% filter(!is.na(movies$genres))

# Write the cleaned dataset to the 'output' folder in the project structure
write_csv(movies, "../../gen/data-preparation/temp/movies_cleaned.csv")


