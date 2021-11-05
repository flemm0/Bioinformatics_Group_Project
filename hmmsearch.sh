for alignment in aligned-fastas/*.hmm
do
	protein=$(basename ${alignment#/*} .hmm)
	for transcript in rnaseq-files/*.fasta #iterates through the four RNAseq files
	do 
		base=$(basename ${transcript#/*} .fasta)
		hmmsearch --tblout $protein.txt $alignment $transcript
		hits=$(grep -v “#” $protein.txt | wc -l)
		echo $hits, $protein, $base >> hits.csv
		rm $protein.txt
	done
done 
