FROM bioconductor/bioconductor_docker:RELEASE_3_13

RUN apt-get update && \
	apt-get install -y --no-install-recommends texlive texi2html texinfo texlive-fonts-extra texlive-latex-extra && \
	R --slave -e "install.packages(pkgs=c('rmarkdown','tidyverse','magick','R.utils'))" && \
	R --slave -e "BiocManager::install(pkgs=c('BiocStyle','IHW','DESeq2', 'BiocParallel', 'BiocGenerics', 'data.table', 'GenomeInfoDb', 'GenomicRanges', 'S4Vectors', 'SummarizedExperiment','BiocCheck'))" && \
	apt-get clean && \
	apt-get autoremove -y
	
# vignette & vignette building dependencies: rmakrdown, tidyverse, magick
# DEWSeq dependencies: R.utils
# vignette & vignette building dependencies: BiocStyle
# DEWSeq vignette example dependency: IHW
# DEWSeq dependencies: DESeq2, BiocParallel, BiocGenerics, data.table, GenomeInfoDb, GenomicRanges, S4Vectors, SummarizedExperiment
# Bioconductor build dependency: BiocCheck
