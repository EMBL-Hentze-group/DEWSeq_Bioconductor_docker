FROM bioconductor/bioconductor_docker:devel

RUN apt-get update \
	&& apt-get install -y cargo libtesseract-dev libleptonica-dev libavfilter-dev \
	&& apt-get install -y --no-install-recommends texlive texlive-latex-extra \
	texlive-fonts-extra texlive-bibtex-extra texlive-science texi2html texinfo \
	&& apt-get clean
	
# vignette & vignette building dependencies: rmakrdown, tidyverse, magick
# DEWSeq dependencies: R.utils
RUN R -e "install.packages(pkgs=c('rmakrdown','tidyverse','magick','R.utils'),dependencies=TRUE)"
# vignette & vignette building dependencies: BiocStyle
# DEWSeq vignette example dependency: IHW
# DEWSeq dependencies: DESeq2, BiocParallel, BiocGenerics, data.table, GenomeInfoDb, GenomicRanges, S4Vectors, SummarizedExperiment
# Bioconductor build dependency: BiocCheck
RUN R -e "BiocManager::install(pkgs=c('BiocStyle','IHW','DESeq2', 'BiocParallel', 'BiocGenerics', 'data.table', 'GenomeInfoDb', 'GenomicRanges', 'S4Vectors', 'SummarizedExperiment','BiocCheck'))"

