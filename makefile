all: data-preparation data-analysis paper 

data-preparation:
	make -C src/data_preparation

data-analysis:
	make -C src/analysis


paper: 
	make -C src/paper

clean:
	R -e "unlink('*.pdf')"
	R -e "unlink('*.html')"
	R -e "unlink('$(DATA)', recursive = TRUE)"
	R -e "unlink('$(TEMP)', recursive = TRUE)"
	R -e "unlink('$(OUTPUT)', recursive = TRUE)"


