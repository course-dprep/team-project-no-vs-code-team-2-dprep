library(dplyr)
library(stringr)
library(tidyverse)
library(scales)

# Importing the data set 
movies <- read_csv('movies.csv')

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

# Creating a histogram that shows the frequency of each movie genres
ggplot(genre_data, aes(x = Genre, y = Count)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(title = "Frequency of Movie Genres", x = "Genre", y = "Count") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))+
  scale_y_continuous(labels = comma)

# Ensure averageRating is numeric
movies$averageRating <- as.numeric(movies$averageRating)

# This plot gives an overview of how the Average Rating of all movies in the data set have been distributed.
ggplot(movies, aes(x=averageRating)) + 
  geom_bar() + ggtitle("Average rating by number of movies") +
  ylab("Number of movies") + xlab("Average rating") +
  scale_y_continuous(labels = scales::number_format(big.mark = ",", accuracy = 1))

# Convert data from wide to long format for genres
movies_long <- movies %>%
  pivot_longer(cols = starts_with("D"), names_to = "Genre", values_to = "HasGenre") %>%
  filter(HasGenre == 1)

# Calculate average rating per genre
average_rating_per_genre <- movies_long %>%
  group_by(Genre) %>%
  summarise(AverageRating = mean(averageRating, na.rm = TRUE)) %>%
  arrange(desc(AverageRating))

# Get the top 5 genres with the highest average rating
top_5_genres_rating <- average_rating_per_genre %>%
  top_n(5, AverageRating)

# Count the frequency of each genre
genre_frequency <- movies_long %>%
  group_by(Genre) %>%
  summarise(Count = n()) %>%
  arrange(desc(Count))

# Get the top 5 most frequent genres
top_5_genres_frequency <- genre_frequency %>%
  top_n(5, Count)

# combining datasets for Genre 
combined_data_genre <- average_rating_per_genre %>%
  left_join(genre_frequency, by = "Genre")

# Explore how the average rating varies by genre (for the 5 most frequent movie genres). This can reveal if certain genres tend to receive higher or lower ratings.

# 1. For Drama -> Drama get higher rating than no Drama
ggplot(movies, aes(x = averageRating, fill = factor(DDrama))) + 
  geom_density(alpha = 0.5) +
  facet_wrap(~ factor(DDrama)) +
  labs(title = "Distribution of Ratings by Genre", x = "Average Rating", y = "Density") +
  theme_minimal()

# 2. For Comedy -> Comedy get a bit higher rating than no Comedy 
ggplot(movies, aes(x = averageRating, fill = factor(DComedy))) + 
  geom_density(alpha = 0.5) +
  facet_wrap(~ factor(DComedy)) +
  labs(title = "Distribution of Ratings by Genre", x = "Average Rating", y = "Density") +
  theme_minimal()

# 3. For Documentary -> Documentary a bit higher rating than no Documentary
ggplot(movies, aes(x = averageRating, fill = factor(DDocumentary))) + 
  geom_density(alpha = 0.5) +
  facet_wrap(~ factor(DDocumentary)) +
  labs(title = "Distribution of Ratings by Genre", x = "Average Rating", y = "Density") +
  theme_minimal()

# 4. For Romance -> Romance gets a bit of a lower rating
ggplot(movies, aes(x = averageRating, fill = factor(DRomance))) + 
  geom_density(alpha = 0.5) +
  facet_wrap(~ factor(DRomance)) +
  labs(title = "Distribution of Ratings by Genre", x = "Average Rating", y = "Density") +
  theme_minimal()

# 5. For Action -> Action gets a bit of a lower rating  
ggplot(movies, aes(x = averageRating, fill = factor(DAction))) + 
  geom_density(alpha = 0.5) +
  facet_wrap(~ factor(DAction)) +
  labs(title = "Distribution of Ratings by Genre", x = "Average Rating", y = "Density") +
  theme_minimal()

# visualize the distribution of ratings within different genres using boxplots 
ggplot(movies_long, aes(x = Genre, y = averageRating)) +
  geom_boxplot() +
  labs(title = "Boxplot of Ratings by Genre", x = "Genre", y = "Average Rating") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Boxplot of runtime by genre
ggplot(movies_long, aes(x = Genre, y = runtimeMinutes, fill = Genre)) +
  geom_boxplot() +
  labs(title = "Boxplot of Runtime by Genre", x = "Genre", y = "Runtime (minutes)") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Filter for specific genres
selected_genres <- c("Action", "Comedy", "Drama")
movies_filtered <- movies_long %>%
  filter(Genre %in% selected_genres)

# Histogram of runtime for the five highest rated genres
# Filter for specific genres
selected_genres <- c("DAction", "DComedy", "DDrama", "DRomance","DDocumentary")
movies_filtered <- movies_long %>%
  filter(Genre %in% selected_genres)

ggplot(movies_filtered, aes(x = runtimeMinutes, fill = Genre)) +
  geom_histogram(binwidth = 10, position = "dodge") +
  labs(title = "Histogram of Runtime for Selected Genres", x = "Runtime (minutes)", y = "Count") +
  theme_minimal()

