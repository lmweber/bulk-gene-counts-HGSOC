#!/bin/bash

###############################################
# Script to quantify RNA-seq reads using Salmon
# Lukas Weber, Oct 2020
###############################################

# note Salmon quantifies reads at transcript level

# using example code from https://combine-lab.github.io/salmon/getting_started/


# submit job on JHPCE cluster
# qsub -V -cwd -pe local 8 -l mem_free=10G,h_vmem=11G,h_fsize=100G salmon_quantify.sh


# note: requires loading gcc and libraries, and local installation of salmon
module load gcc/9.1.0
salmon --version


# quantify RNA-seq reads for each sample
# note: could simplify using for loop when we have more samples; see https://combine-lab.github.io/salmon/getting_started/
# runtime: 

dir='../data/HGSOC/17667R/Fastq'

samp='17667X1'
fn='17667X1_200214_A00421_0157_BHK52CDRXX_S43_L002'
echo "Processing sample ${samp}"
salmon quant -i ../data/index/gencode.v35.transcripts_index -l A \
  -1 ${dir}/${fn}_R1_001.fastq.gz \
  -2 ${dir}/${fn}_R2_001.fastq.gz \
  -p 8 --validateMappings -o ../quants/${samp}_quant

samp='17667X2'
fn='17667X2_200214_A00421_0157_BHK52CDRXX_S42_L002'
echo "Processing sample ${samp}"
salmon quant -i ../data/index/gencode.v35.transcripts_index -l A \
-1 ${dir}/${fn}_R1_001.fastq.gz \
-2 ${dir}/${fn}_R2_001.fastq.gz \
-p 8 --validateMappings -o ../quants/${samp}_quant

samp='17667X3'
fn='17667X3_200214_A00421_0157_BHK52CDRXX_S41_L002'
echo "Processing sample ${samp}"
salmon quant -i ../data/index/gencode.v35.transcripts_index -l A \
-1 ${dir}/${fn}_R1_001.fastq.gz \
-2 ${dir}/${fn}_R2_001.fastq.gz \
-p 8 --validateMappings -o ../quants/${samp}_quant

