# Load package
library(tidyverse)

# DOWNLOAD DATA 

# Create data folder 
dir.create('../../data')

# Create a vector of URLs to download the IMDb datasets (basics and ratings)
urls = c('https://datasets.imdbws.com/title.basics.tsv.gz', 'https://datasets.imdbws.com/title.ratings.tsv.gz')

# Read the datasets from the URLs, treating tab as the delimiter and '\N' as NA values
datasets <- lapply(urls, read_delim, delim='\t', na = '\\N')

# Subset the datasets from the list to create two individual dataframes:
# 'basics' holds movie titles, genres, and other metadata
# 'ratings' holds the average rating and number of votes for each title
basics <- datasets[[1]]
ratings <- datasets[[2]]

# Transform the 'basics' and 'ratings' dataframe into a CSV file and save it in the specified directory
write_csv(basics, "../../data/basics.csv")
write_csv(ratings, "../../data/ratings.csv")


