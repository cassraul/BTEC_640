# Bash Loops Class Exercise
# This script should be run in the bash shell. It demonstrates the use of loops to automate tasks.
# Cassandra Raul
# Sep 16, 2026 Ver. 1
# To run this script, save it as bash_loops_class_excercise_canvas.sh and execute it in your terminal. You will need to have internet access to download the necessary files.

cd documents/
# This will change the current directory to the documents folder. Make sure you have a documents folder in your home directory.

cd btec_640/
# This will change the current directory to the btec_640 folder. Make sure you have a btec_640 folder in your documents directory.

cd class_excercises
# This will change the current directory to the class_excercises folder. Make sure you have a class_excercises folder in your btec_640 directory.

mkdir bash_loops_09142026_class_excercise
# This command creates a new directory called bash_loops_09142026_class_excercise. This is where we will store all the files related to this exercise.

cd bash_loops_09142026_class_excercise/
# This command changes the current directory to the newly created bash_loops_09142026_class_excercise directory.

mkdir input_data
# This command creates a new directory called input_data. This is where we will download the necessary input files for this exercise.

cd input_data/
#This command changes the current directory to the input_data directory.

curl -o hg38.ncbiRefSeq.gtf.gz "https://hgdownload.soe.ucsc.edu/goldenPath/hg38/bigZips/genes/hg38.ncbiRefSeq.gtf.gz"
# This command uses curl to download the hg38.ncbiRefSeq.gtf.gz file from the UCSC Genome Browser and saves it in the input_data directory. The -o option specifies the output filename.

less hg38.ncbiRefSeq.gtf.gz
# This command opens the hg38.ncbiRefSeq.gtf.gz file in the less pager, allowing you to view its contents without extracting it. You can scroll through the file using the arrow keys and exit by pressing 'q'.

gunzip hg38.ncbiRefSeq.gtf.gz
# This command decompresses the hg38.ncbiRefSeq.gtf.gz file, resulting in the hg38.ncbiRefSeq.gtf file. The original .gz file will be removed after decompression.

less hg38.ncbiRefSeq.gtf
# This command opens the hg38.ncbiRefSeq.gtf file in the less pager, allowing you to view its contents. You can scroll through the file using the arrow keys and exit by pressing 'q'.

cd ../
# This command changes the current directory back to the bash_loops_09142026_class_excercise directory.

mkdir analysis
# This command creates a new directory called analysis. This is where we will perform our data analysis.

cd analysis/
# This command changes the current directory to the analysis directory.

ln -s ../input_data/hg38.ncbiRefSeq.gtf
# This command creates a symbolic link to the hg38.ncbiRefSeq.gtf file in the analysis directory. This allows us to access the file without duplicating it.

grep "chr21" hg38.ncbiRefSeq.gtf
# This command searches for lines containing "chr21" in the hg38.ncbiRefSeq.gtf file and displays them in the terminal. This is useful for filtering the data to only include entries related to chromosome 21.

grep -c "chr21" hg38.ncbiRefSeq.gtf
# This command counts the number of lines containing "chr21" in the hg38.ncbiRefSeq.gtf file and displays the count in the terminal. This gives us an idea of how many entries are related to chromosome 21.

grep "chr21" hg38.ncbiRefSeq.gtf > chr21.gtf
# This command searches for lines containing "chr21" in the hg38.ncbiRefSeq.gtf file and saves them to a new file called chr21.gtf. This file will contain only the entries related to chromosome 21.

grep "NM_" chr21.gtf > refseq_chr21.gtf
# This command searches for lines containing "NM_" in the chr21.gtf file and saves them to a new file called refseq_chr21.gtf. This file will contain only the RefSeq entries related to chromosome 21.

awk -F '\t' '{print $9}' refseq_chr21.gtf | head
# This command extracts the 9th column (attributes) from the refseq_chr21.gtf file and displays the first 10 lines. The attributes column contains information about gene names, transcript IDs, and other relevant data.

awk -F '\t' '{print $9}' refseq_chr21.gtf | awk -F '"' '{print $2, $4}' | head
# This command extracts the 9th column (attributes) from the refseq_chr21.gtf file, splits it by double quotes, and prints the second and fourth fields (gene name and transcript ID). The head command displays the first 10 lines of the output.

awk -F '\t' '{print $9}' refseq_chr21.gtf  | awk -F'"' '!seen[$2]++ {print $2, $4}' refseq_chr21.gtf > gene_accession.txt
# This command extracts the 9th column (attributes) from the refseq_chr21.gtf file, splits it by double quotes, and prints the second and fourth fields (gene name and transcript ID) while ensuring that only unique gene names are included. The output is saved to a new file called gene_accession.txt.

head -n 10 gene_accession.txt > 10_genes.txt
# This command takes the first 10 lines of the gene_accession.txt file and saves them to a new file called 10_genes.txt. This file will be used in the next step to download the corresponding fasta files for these genes.

while read -r gene accession; do     curl -o "${gene}.fasta" "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nuccore&id=${accession}&rettype=fasta&retmode=text";  done < 10_genes.txt
# This while loop reads each line of the 10_genes.txt file, extracting the gene name and accession number. It then uses curl to download the corresponding fasta file for each gene from the NCBI database, saving it with the gene name as the filename.

ls -l *.fasta
# lists the files in the directory with the fasta extension, which are the files we just downloaded