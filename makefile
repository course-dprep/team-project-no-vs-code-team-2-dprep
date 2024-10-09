all: data-preparation data-analysis paper

data-preparation:
	make -C src/data_preparation

data-analysis:
	make -C src/analysis

paper:
	make -C src/paper

clean: 
	R -e "unlink('*pdf')"
	R -e "unlink('*csv')"
	R -e "unlink('*html')"
	R -e "unlink('data', recursive = TRUE)"
	R -e "unlink('gen', recursive = TRUE)"

