# download data

library(tidyverse)
urls = c('https://datasets.imdbws.com/title.basics.tsv.gz', 'https://datasets.imdbws.com/title.ratings.tsv.gz')
datasets <- lapply(urls, read_delim, delim='\t', na = '\\N')

# sub-setting data sets 
basics <- datasets[[1]]
ratings <- datasets[[2]]

# transform data sets into csv files 
write_csv(basics, "basics.csv")
write_csv(ratings, "ratings.csv")
