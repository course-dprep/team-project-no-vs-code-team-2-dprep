library(dplyr)
library(stringr)

movies <- read_csv('movies.csv')

#Making a list of all different genres retrieved from IMDB's website
genres <- c("Action", "Adventure", "Animation", "Biography", "Comedy", "Crime", "Documentary", "Drama", "Family", "Fantasy", "Film-Noir", "Game-Show", "History", "Horror", "Music", "Musical", "Mystery", "News", "Reality-TV", "Romance", "Sci-Fi", "Short", "Sport", "Talk-Show", "Thriller", "War", "Western")


#Writing a loop to create a dummy variable for each specific genre
for (genre in genres) {
  genre_col <- paste0("D", genre)
  movies <- movies %>%
    mutate(!!genre_col := as.integer(str_detect(genres, genre)))
}

#Creating a summary that shows us the number of each genre present in the dataset
dummy_cols <- movies %>% select(starts_with("D"))
genre_summary <- colSums(dummy_cols)
genre_summary

#Getting rid of the DShort column as it has zero entries
movies <- movies %>% select(-DShort)
