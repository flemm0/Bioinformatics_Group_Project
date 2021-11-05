#!/bin/bash
set -e

echo "Blasting nucleotide sequences..."
blastn -db nt -query uniquetranscripts.fasta -outfmt 10 -max_target_seqs 1 -out results.csv -remote
echo "Finished"
