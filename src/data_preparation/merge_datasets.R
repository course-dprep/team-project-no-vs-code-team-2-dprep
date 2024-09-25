# Load package
library(tidyverse)

# MERGE DATASETS 

# Read the 'basics' and 'ratings' dataset from the specified path 
basics <- read_csv("../../data/basics.csv")
ratings <- read_csv("../../data/ratings.csv")

# Merge the 'basics' and 'ratings' datasets based on their common columns 
movies <- merge(basics, ratings)

# Transform the 'basics' and 'ratings' dataframe into a CSV file and save it in the specified directory
write_csv(movies, "../../gen/data-preparation/temp/merged_movies.csv")
