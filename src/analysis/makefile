DATA = ../../gen/data_preparation/output
OUTPUT = ../../gen/data-analysis/output

all: $(OUTPUT)/data_analysis.html

$(OUTPUT)/data_analysis.html: data_analysis.Rmd $(DATA)/movies.csv render.R
	R -e "dir.create('../../gen/data-analysis/output', recursive = TRUE)"
	Rscript -e 'rmarkdown::render("data_analysis.Rmd", output_dir = "$(OUTPUT)")'

clean:
	R -e "unlink('*.pdf')"
	R -e "unlink('*.html')"
	R -e "unlink('$(DATA)', recursive = TRUE)"
	R -e "unlink('$(TEMP)', recursive = TRUE)"
	R -e "unlink('$(OUTPUT)', recursive = TRUE)"