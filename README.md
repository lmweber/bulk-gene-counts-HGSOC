# bulk-gene-counts-HGSOC

Scripts to process bulk RNA-seq samples in HGSOC project.

Scripts to run in order are:
- `salmon_index.sh` - generate transcriptome index for Salmon
- `salmon_quantify.sh` - quantify RNA-seq reads at transcript level using Salmon
- `gene_counts_tximeta.R` - import transcript counts and aggregate to gene counts using tximeta


## Sample names

Note that bulk and single-cell RNA-seq sample names in this dataset are in a different order:

| bulk sample name | single-cell sample name |
| ---------------- | ----------------------- |
| 17667X1          | 16030X3                 |
| 17667X2          | 16030X2                 |
| 17667X3          | 16030X4                 |

