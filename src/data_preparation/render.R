install.packages("rmarkdown")
library(rmarkdown)

# Step 1: Render the RMarkdown file in its current directory
rmarkdown::render("src/data_preparation/data_exploration.Rmd")

# Step 2: Copy the output HTML file to the desired directory
file.copy("src/data_preparation/data_exploration.html", "../../gen/data-preparation/output/data_exploration.html", overwrite = TRUE)

# Step 3: Remove the original file from the current directory
file.remove("src/data_preparation/data_exploration.html")
