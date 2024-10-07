install.packages("rmarkdown")
library(rmarkdown)

# Step 1: Render the RMarkdown file in its current directory
rmarkdown::render("src/analysis/data_analysis.Rmd")

# Step 2: Copy the output HTML file to the desired directory
file.copy("src/analysis/data_analysis.html", "../../gen/data-analysis/output/data_analysis.html", overwrite = TRUE)

# Step 3: Remove the original file from the current directory
file.remove("src/analysis/data_analysis.html")
