# The Impact of Runtime on IMDb Ratings: A Genre-Focused Study

This project explores if there is a correlation between the runtime of a movie and its IMDb rating. We focus on different genres to find out if the result differs across genres, as this can help filmmakers in deciding how long their films should be. 


## 1. Introduction

### 1.1 Research Motivation 
The research question — exploring whether there is a correlation between movie runtime and IMDb rating with a specific focus on genre — is of significant importance. This exploration delves into understanding how different genres come with distinct audience expectations. Filmmakers often face tough decisions about how long their films should be. A longer runtime allows for more detailed storytelling, character development, and complex narratives, but it may also test the audience's patience. On the other hand, shorter films might be more accessible and appealing to time-constrained viewers but could risk feeling rushed or underdeveloped. Hence, deciding on the runtime of the movie is a difficult task for a movie maker, and any insight in this can be valuable. 

To expand on why the correlation between movie runtime and IMDb rating might differ by genre, consider how different genres have unique storytelling conventions and audience expectations. For example, dramas or fantasy films often require longer runtimes to build complex worlds, develop multi-layered characters, and create intricate plots. In contrast, comedies or action films tend to have shorter runtimes, focusing on pacing and delivering quick entertainment. Therefore, what works for one genre may not work for another, and the audience's tolerance for length can vary depending on these genre conventions.

### 1.2 Relevance 
By examining how run time impacts ratings within specific genres, this research can provide valuable insights into audience preferences. Directors can benefit from understanding whether a tight, concise run time is more effective for genres like for example comedy, or if extending the run time enhances character development in dramas. Not only is this research relevant to filmmakers, but also academic stakeholders can gain insights from this. For example, it can give insights to media psychological researches on media consumption with regards to attention span. 

### 1.3 Research Question 
Is there a correlation between a movie's run time and its IMDb rating, with a focus on genre?


## 2. Method

### 2.1 Research Method 
Firstly, to collect the required data, we extracted two datasets from the IMDb website that included the basic information of the different movies and one dataset with the ratings of the movies. After cleaning the data, we were left with  (...) movies. These movies are used to conduct the regression analysis. This analysis allows for a clear exploration of how runtime correlates with ratings, while controlling for genre. This approach not only highlights the relationship between runtime and audience satisfaction but also offers data-driven guidance for filmmakers.

### 2.2 Variables 
The following variables are being used in the data set:  
  
| Variables | Description | 
|---------|---------|
| tconst   | The movie ID   | 
| titleType   | The title type, in the dataset only movies   | 
| primaryTitle   | The title of the movie   |    
| isAdult   | Dummy variable stating if it is a adult movie   |  
| startYear   | When the movie first launched   |  
| runtimeMinutes   | The total run time of the movie in minutes   |  
| genres   | The genre of the movie   |    
| averageRating   | The average rating of the movie on a scale of 1-10   |  
| numVotes   | The number of total ratings of the movie   |  


## 3. Results and interpretation 


## 4. Repository overview 


## 5. Running instructions 

### 5.1 Libraries 
In R the following package were installed. If you did not download them yet, please install them, and use the install.packages() to do so. 
```
library(tinytex)
library(tidyverse)
library(ggplot2)
```

### 5.2 Running the code 


## 6. About 
This project was conducted by a team of students of Tilburg University that follow the course Data Preparation and Workflow Management. The team member are: 
- Trees van Ham 
- Wouter Kole 
- Sander Kessels
- Georgios Mitroglou 
- Carli Marban, email: c.marban@tilburguniversity.edu 