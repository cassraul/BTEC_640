# Bash dictionary
# Cassandra Raul
# Most recent update: Sept 16
# No files or tools required to read



# To change directories down: cd 
#       Example: cd /Documents/BTEC - should Change Directories to -> Documents -> BTEC

# To change directories up: cd ../
#       Example: cd ../ - should Change Directories from BTEC -> Documents

# To list files and directories: ls
#       This will LiSt whatever folders are inside your current folder

# To create a new directory: mkdir
#       Example: mkdir results - will MaKe a new DIRectory (folder) named "results"

# To write everything in a new file: use operator ">"
#       This will write everything you just asked into a new file
#       Example: grep "chr21" hg38.ncbiRefSeq.gtf > chr21.gtf  - will grep (search) for term "chr21" in file "hg38.ncbi...gtf" and write what it finds (>) into a new file "chr21.gtf"

# To remove something: rm
#       Example: rm* tmp - this should ReMove (rm) everything (* )
#       Example: rm*.tmp - this should ReMove (rm) everything ending in .tmp (*.tmp)

# To print something: echo

# To open a file: cat
#       Example: cat FILE - should open your document names FILE

# To tell the computer we are working inside an array: use operator "{}"
#       Example: echo "${STUDENTS}" - this should print (echo) your array named STUDENTS

# To tell the computer to do something on a new line: \n

# To tell the computer to randomize data: shuf
#       This is the shuffle command

# To type in a file from the terminal: nano

# To download a file from the web: curl
#       Example: curl -o OUTPUT FILE NAME "URL" - this should fetch data from a URL (curl) and save what it fetches into a new file (-o) that you named (OUTPUT FILE NAME) from your specific website ("URL" in quotes)

# To download a file from the web: wget

# To open a file: less
#        Example: less FILENAME - should open (less) the file of your choice (FILENAME) from within your directory
#           In an open file, press "q" button to Quit (exit) out of the file
#           In an open file, press "space" button to go down the page of the file

# To unzip a file: gunzip
#       Example: gunzip FILENAME.gz - this should unzip (gunzip) a gzip formatted zip folder (FILENAME.gz) for a new uncompressed version; this DOES change the name of the file
#           .zip is not .gz; they are different file types

# To search for specific words/phrases: grep

# To count a number of something in your file: -c

# To do basic field filtering: awk
#   This should do basic pattern and text processing line by line to break data into columns (either by a tab or by quotes)