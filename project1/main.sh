#Decker Gramlich
#CS490-002 Project 1

read -p "Enter URL: " url # ask user for url
fileName=$(basename $url) # gets the .bed.gz file name from parsing the url
baseName=${fileName%%.*} # gets the file name from parsing the .bed.gz file
posBed=~/project1/data/beds/positives/posBed$baseName.bed # path to file for the positive bed file
negBed=~/project1/data/beds/negatives/negBed$baseName.bed # path to file for the negative bed file
posSeq=~/project1/data/sequences/positives/posSeq$baseName # path to file for the positive sequence file
negSeq=~/project1/data/sequences/negatives/negSeq$baseName # path to file for the negative sequence file
reference=/proj/SIUE-CS590-490/reference/hg38.fa # path to reference genome
wget $url -O ~/project1/data/beds/positives/posBed$fileName # downloads .bed.gz from link
gunzip $posBed.gz # gunzips the .bed.gz file into a .bed file (positive)
python ~/project1/makeNegative.py $posBed, $negBed # python script that creates the negative .bed file
bedtools getfasta -fi $reference -bed $posBed -fo $posSeq # creates the sequence file from the positive .bed file and reference genome
bedtools getfasta -fi $reference -bed $negBed -fo $negSeq # creates the sequence file from the negative .bed file and reference genome
python ~/project1/format.py $posSeq # python script that crops the positive sequence file
python ~/project1/format.py $negSeq # python script that crops the negative sequence file (same script, different input)