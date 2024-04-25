#Decker Gramlich
#CS490-002 Project 2

import os

def merge_files(directory_path, output_file):
    
    with open(output_file, 'w') as outfile:
        # Loop through each file in the directory
        for filename in os.listdir(directory_path):
            # Construct the full file path
            file_path = os.path.join(directory_path, filename)
            
            # Check if it's a file and not a directory
            if os.path.isfile(file_path):
                # Open the file in read mode
                with open(file_path, 'r') as infile:
                    # Read the contents of the file
                    contents = infile.read()
                    # Write the contents to the output file
                    outfile.write(contents + '\n')  # Adding a newline for separation

def zipperFiles(Pos, Neg, output):
    with open(Pos, 'r') as pos, open(Neg, 'r') as neg, open(output, 'w') as out:
        line0 = neg.readline()
        line1 = pos.readline()
        while line0 or line1:
            if line0:
                out.write("0 " + line0)
                line0 = neg.readline()
            if line1:
                out.write("1 " + line1)
                line1 = pos.readline()

positive = "data/allPositives"
negative = "data/allNegatives"

merge_files("data/sequencesPositives", positive)
merge_files("data/sequencesNegatives", negative)
zipperFiles(positive, negative, "data/allData")