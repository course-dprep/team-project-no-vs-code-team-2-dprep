DATA = ../../gen/data-preparation/output
OUTPUT = ../../gen/data-analysis/output

all: $(OUTPUT)/data_analysis.html

$(OUTPUT)/data_analysis.html: data_analysis.Rmd $(DATA)/movies.csv render.R
	R -e "dir.create('../../gen/data-analysis/output', recursive = TRUE)"
	Rscript -e 'rmarkdown::render("data_analysis.Rmd", output_dir = "$(OUTPUT)")'

