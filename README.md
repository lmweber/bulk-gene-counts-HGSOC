# bulk_gene_counts_HGSOC

Scripts to process bulk RNA-seq samples in HGSOC project.

Scripts to run in order are:
- `salmon_index.sh` - generate transcriptome index for Salmon
- `salmon_quantify.sh` - quantify RNA-seq reads at transcript level using Salmon
- `gene_counts_tximeta.R` - import transcript counts and aggregate to gene counts using tximeta

