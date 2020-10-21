####################################################################
# Script to aggregate transcript counts to gene level using tximport
# Lukas Weber, Oct 2020
####################################################################

# run in interactive session on JHPCE cluster
# module load conda_R/4.0
# R


library(tximport)
library(TxDb.Hsapiens.UCSC.hg38.knownGene)
# readr is not strictly required but speeds up tximport when available
library(readr)


# locate output files from Salmon
dir <- file.path("..", "quants")
samples <- c("17667X1", "17667X2", "17667X3")
files <- file.path(dir, paste0(samples, "_quant"), "quant.sf")

files


# create table mapping transcript IDs to gene IDs
# see tximport vignette
txdb <- TxDb.Hsapiens.UCSC.hg38.knownGene
k <- keys(txdb, keytype = "TXNAME")
tx2gene <- select(txdb, k, "GENEID", "TXNAME")
dim(tx2gene)

# remove NAs (transcript IDs with missing gene IDs)
tx2gene <- na.omit(tx2gene)
dim(tx2gene)

head(tx2gene)


# run tximport to aggregate counts to gene level
txi <- tximport(files, type = "salmon", tx2gene = tx2gene)

names(txi)
head(txi$counts)


# save output object
dir.create("../tximport")
save(txi, file = "../tximport/tximport_counts_17667X1-3.RData")

