#!/bin/bash

#####################################################
# Script to generate transcriptome index using Salmon
# Lukas Weber, Oct 2020
#####################################################

# using example code from https://combine-lab.github.io/salmon/getting_started/


# submit job on JHPCE cluster
# qsub -V -cwd -pe local 8 -l mem_free=2G,h_vmem=3G,h_fsize=100G salmon_index.sh


# note: requires loading gcc and libraries, and local installation of salmon
module load gcc/9.1.0
salmon --version


# download transcriptome file
CWD=$(pwd)
cd ../data
mkdir -p index
cd index
wget ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_35/gencode.v35.transcripts.fa.gz

# create transcriptome index
# runtime: ~5 min using 8 cores
salmon index -t gencode.v35.transcripts.fa.gz -i gencode.v35.transcripts_index --gencode -p 8

cd $CWD

