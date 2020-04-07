FROM bioconductor/bioconductor_docker:devel

# vignette & vignette building dependencies
RUN R -e "install.packages(pkgs=c('rmakrdown','tidyverse'),dependencies=TRUE)"
RUN R -e "BiocManager::install(pkgs=c('BiocStyle'))"
# DEWSeq dependencies
RUN R -e "BiocManager::install(pkgs=c('DESeq2', 'BiocParallel', 'BiocGenerics', 'data.table', 'GenomeInfoDb', 'GenomicRanges', 'S4Vectors', 'SummarizedExperiment'))"