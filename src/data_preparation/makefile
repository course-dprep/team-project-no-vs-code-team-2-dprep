DATA = ../../data
TEMP = ../../gen/data-preparation/temp
OUTPUT = ../../gen/data-preparation/output

all: $(OUTPUT)/data_exploration.html

$(DATA)/basics.csv $(DATA)/ratings.csv: download_data.R
	R --vanilla < download_data.R

$(TEMP)/merged_movies.csv: merge_datasets.R $(DATA)/basics.csv $(DATA)/ratings.csv
	R -e "dir.create('../../gen/data-preparation/temp', recursive = TRUE)"
	R --vanilla < merge_datasets.R

$(TEMP)/movies_cleaned.csv: data_cleaning.R $(TEMP)/merged_movies.csv
	R --vanilla < data_cleaning.R
	
$(OUTPUT)/movies.csv: data_exploration.R $(TEMP)/movies_cleaned.csv
	R -e "dir.create('../../gen/data-preparation/output', recursive = TRUE)"
	R --vanilla < data_exploration.R

$(OUTPUT)/data_exploration.html: data_exploration.Rmd $(OUTPUT)/movies.csv 
	Rscript -e 'rmarkdown::render("data_exploration.Rmd", output_dir = "$(OUTPUT)")'

