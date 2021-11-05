#!/bin/bash

set -e
mkdir -p aligned-proteins

echo "Making protein alignments..."

for file in *.fasta
do
	base=!(basename $file .fasta)
	muscle -in $file -out $base.afa
done

echo "Finished"

echo "Moving files to aligned-proteins directory..."
mv *.afa aligned-proteins

cd aligned-proteins

echo "Building HMM profiles..."
for file in *.afa
do
	base=$(basename $file .afa)
	hmmbuild $base.hmm $file
done
echo "Finished"
