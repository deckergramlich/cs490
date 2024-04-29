#Decker Gramlich
#CS490-002 Project 2


urls = ~/project2/data/urls.txt
reference=/proj/SIUE-CS590-490/reference/hg38.fa # path to reference genome

while IFS= read -r url
do
    fileName=$(basename $url) # gets the .bed.gz file name from parsing the url
    baseName=${fileName%%.*} # gets the file name from parsing the .bed.gz file
    posBed = ~/project2/data/bedsPositives/posBed$baseName.bed # path to file for the positive bed file
    negBed = ~/project2/data/bedsNegatives/negBed$baseName.bed # path to file for the negative bed file
    posSeq = ~/project2/data/sequencesPositives/posSeq$baseName # path to file for the positive sequence file
    negSeq = ~/project2/data/sequencesNegatives/negSeq$baseName # path to file for the negative sequence file
    wget $url -O ~/project2/data/bedsPositives/posBed$fileName # downloads .bed.gz from link
    gunzip $posBed.gz # gunzips the .bed.gz file into a .bed file (positive)
    python ~/project2/makeNegative.py $posBed, $negBed # python script that creates the negative .bed file
    bedtools getfasta -fi $reference -bed $posBed -fo $posSeq # creates the sequence file from the positive .bed file and reference genome
    bedtools getfasta -fi $reference -bed $negBed -fo $negSeq # creates the sequence file from the negative .bed file and reference genome
    python ~/project2/format.py $posSeq # python script that crops the positive sequence file
    python ~/project2/format.py $negSeq # python script that crops the negative sequence file (same script, different input)

done < "$urls"

python ~/project2/combineFiles.py
