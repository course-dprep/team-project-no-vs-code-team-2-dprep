DATA = ../../gen/data-preparation/output
OUTPUT = ../../gen/final-report/output

$(OUTPUT)/Final_report.pdf: Final_report.Rmd $(DATA)/movies.csv 
	R -e "dir.create('../../gen/final-report/output', recursive = TRUE)"
	Rscript -e 'rmarkdown::render("Final_report.Rmd", output_dir = "$(OUTPUT)")'

