FROM bioconductor/bioconductor_docker:RELEASE_3_10

RUN apt-get update \
	&& apt-get install -y cargo libtesseract-dev libleptonica-dev libavfilter-dev \
	&& apt-get install -y --no-install-recommends texlive texlive-latex-extra \
	texlive-fonts-extra texlive-bibtex-extra texlive-science texi2html texinfo \
	&& apt-get clean
	
# vignette & vignette building dependencies
RUN R -e "install.packages(pkgs=c('rmakrdown','tidyverse','magick'),dependencies=TRUE)"
RUN R -e "BiocManager::install(pkgs=c('BiocStyle'))"
# DEWSeq vignette example dependency
RUN R -e "BiocManager::install(pkgs=c('IHW'))"
# DEWSeq dependencies
RUN R -e "install.packages('R.utils',dependencies=TRUE)"
RUN R -e "BiocManager::install(pkgs=c('DESeq2', 'BiocParallel', 'BiocGenerics', 'data.table', 'GenomeInfoDb', 'GenomicRanges', 'S4Vectors', 'SummarizedExperiment'))"
# BiocCheck
RUN R -e "BiocManager::install('BiocCheck')"
