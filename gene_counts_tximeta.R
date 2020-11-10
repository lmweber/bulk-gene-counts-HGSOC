####################################################################
# Script to aggregate transcript counts to gene counts using tximeta
# Lukas Weber, Nov 2020
####################################################################

# run on laptop
# running on JHPCE cluster gives error (in 'download.file' when running 'tximeta')

library(tximeta)
library(SummarizedExperiment)


# locate output files from Salmon
dir <- file.path("..", "quants")
samples <- c("17667X1", "17667X2", "17667X3")
files <- file.path(dir, paste0(samples, "_quant"), "quant.sf")
files

# create sample table
coldata <- data.frame(files, names = samples, stringsAsFactors = FALSE)
coldata

# run tximeta to generate transcript-level counts object
se <- tximeta(coldata)

# check object
colData(se)
assayNames(se)
rowRanges(se)
seqinfo(se)

# summarize to gene-level counts
gse <- summarizeToGene(se)

# check object
rowRanges(gse)

# save object
dir.create("../tximeta")
save(gse, file = "../tximeta/gene_counts_17667XX.RData")

