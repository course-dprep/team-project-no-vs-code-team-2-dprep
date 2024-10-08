# The Impact of Runtime on IMDb Ratings: A Genre-Focused Study

This project explores if there is a correlation between the runtime of a movie and its IMDb rating. We focus on different genres to find out if the result differs across genres, as this can help filmmakers in deciding how long their films should be. 


## 1. Introduction

### 1.1 Research Motivation 
The research question — exploring whether there is a correlation between movie runtime and IMDb rating with a specific focus on genre — is of significant importance. This exploration delves into understanding how different genres come with distinct audience expectations. Filmmakers often face tough decisions about how long their films should be (Sharf, 2022). A longer runtime allows for more detailed storytelling, character development, and complex narratives, but it may also test the audience's patience. On the other hand, shorter films might be more accessible and appealing to time-constrained viewers but could risk feeling rushed or underdeveloped. Hence, deciding on the runtime of the movie is a difficult task for a movie maker, and any insight in this can be valuable. 

To expand on why the correlation between movie runtime and IMDb rating might differ by genre, consider how different genres have unique storytelling conventions and audience expectations. For example, dramas or fantasy films often require longer runtimes to build complex worlds, develop multi-layered characters, and create intricate plots. In contrast, comedies or action films tend to have shorter runtimes, focusing on pacing and delivering quick entertainment. Therefore, what works for one genre may not work for another, and the audience's tolerance for length can vary depending on these genre conventions.

### 1.2 Relevance 
By examining how run time impacts ratings within specific genres, this research can provide valuable insights into audience preferences. Directors can benefit from understanding whether a tight, concise run time is more effective for genres like for example comedy, or if extending the run time enhances character development in dramas. Not only is this research relevant to filmmakers, but also academic stakeholders can gain insights from this. For example, it can give insights to media psychological researches on media consumption with regards to attention span. 

### 1.3 Research Question 
Is there a correlation between a movie's run time and its IMDb rating, with a focus on genre?


## 2. Method

### 2.1 Research Method 
Firstly, to collect the required data, we extracted two datasets from the IMDb website that included the basic information of the different movies and one dataset with the ratings of the movies. After cleaning the data, we were left with 279457 movies. These movies are used to conduct the regression analysis. This analysis allows for a clear exploration of how runtime correlates with ratings, while controlling for genre. This approach not only highlights the relationship between runtime and audience satisfaction but also offers data-driven guidance for filmmakers.

### 2.2 Variables 
The following variables are being used in the data set:  
  

| Variables | Description | Data Class
|---------|---------|---------|
| tconst   | The movie ID   | numeric
| titleType   | The title type, in the dataset only movies   | character
| primaryTitle   | The title of the movie   |  character
| isAdult   | Dummy variable stating if it is a adult movie   | logical  
| startYear   | When the movie first launched   |  date
| runtimeMinutes   | The total run time of the movie in minutes   |  numeric
| genres   | The genre of the movie   |   character
| averageRating   | The average rating of the movie on a scale of 1-10   |  numeric
| numVotes   | The number of total ratings of the movie   |  numeric
| DDrama, DAction, DComedy, DAdventure, DCrime, etc.      | Dummy variables for genre    |   logical
| 0 - 30 min, 30 - 60 min, 60 - 90 min, etc.    | Dummy variables for the duration of the movie   | logical      

## 3. Data exploration 

## 4. Results and interpretation 


## 5. Repository overview 
```
|-- data
|-- gen
   |-- data-analysis
        |-- output       
   |-- data-preparation
        |-- temp
        |-- output
   |-- paper
        |-- output
|-- src
   |-- analysis
        |-- data_analysis.Rmd
        |-- makefile
   |-- data_preparation
        |-- download_data.R
        |-- merge_datasets.R
        |-- data_cleaning.R
        |-- data_exploration.R
        |-- data_exploration.Rmd
        |-- makefile
   |-- paper
        |-- Final_report.Rmd
|-- .gitignore
|-- README.md
|-- makefile
```

## 6. Running instructions 

### 6.1 Software  
Below all of the software that was used for creating this research will be listed. 

1. **R and Rstudio** --> All of downloading of the data, the cleaning of the data, the preparation of the data, and the analysis was done using R and Rstudio. Refer to [Set up R and RStudio](https://tilburgsciencehub.com/topics/computer-setup/software-installation/rstudio/r/)" for a instruction on how to install this. 
2. **RMarkdown** --> RMarkdown was used to convert the code from RStudio into more comprehensible pdf documents, allowing for a seamless representation of the data preparation and analysis flow. Refer to the [RMarkdown Installation Guide](https://rmarkdown.rstudio.com/authoring_quick_tour.html#Installation)" for installment. 
3. **make** -->  The tool make was used to be able to automate the workflow and ensure reproducibility of the prject. The guide to install make can be found at this page: [Make Installation Guide](https://tilburgsciencehub.com/building-blocks/configure-your-computer/automation-and-workflows/make/).
4. **Pandoc** --> Finally, to make sure that your computer is able to compile the html document resulting from the RMarkdown source files, you should install Pandoc by following this guide: [Pandoc Installation Guide](https://pandoc.org/installing.html).

### 6.2 Libraries 
In R the following package were installed. If you did not download them yet, please install them, and use the install.packages() to do so. 
```
library(tinytex)
library(tidyverse)
library(rmarkdown)
```

### 6.3 Running the code 

#### Step-by-step using the makefile 
To automatically run all source code files of which this project is composed, pleas follow these instructions:
1. Fork this GitHub repository to your own GitHub account.
2. Open the command line / terminal and run the following code:
```
git clone https://github.com/course-dprep/team-project-no-vs-code-team-2-dprep.git

```
3. Set your working directory to `team-project-no-vs-code-team-2-dprep` and run the following command:
```
make
```


## 7. About 
This project was conducted by a team of students of Tilburg University that follow the course Data Preparation and Workflow Management. 

| Author                                      | Contact                                     | 
|---------------------------------------------|---------------------------------------------|
| **Trees van Ham**                          | t.j.o.vanham@tilburguniversity.edu                      |
| **Wouter Kole**                             | w.p.kole@tilburguniversity.edu                |
| **Sander Kessels**                          | s.t.p.kessels@tilburguniversity.edu             |
| **Carli Marban**                            | c.marban@tilburguniversity.edu              |
| **Georgios Mitroglou**                     | g.mitroglou@tilburguniversity.edu           |

### 8. References 

Sharf, Z. (2022, February 6). Why movies are getting longer: The answer goes beyond the MCU and Oscar bait. CNN. https://edition.cnn.com/2022/02/06/entertainment/movie-runtimes-longer-mcu-batman-oscar-bait-cec/index.html

