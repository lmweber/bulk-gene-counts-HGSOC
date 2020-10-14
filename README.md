# bulk_gene_counts_HGSOC

Scripts to process bulk RNA-seq samples in HGSOC project.

Scripts to run in order are:
- `salmon_index.sh` - generate transcriptome index for Salmon
- `salmon_quantify.sh` - quantify RNA-seq reads at transcriptome level using Salmon
- `tximport_gene_counts.R` - aggregate transcript counts to gene level and generate gene counts table using `tximport`

