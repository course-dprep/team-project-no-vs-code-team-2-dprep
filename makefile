all: data-preparation data-analysis

data-preparation:
	make -C src/data_preparation

data-analysis:
	make -C src/analysis
