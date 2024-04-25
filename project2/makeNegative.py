#Decker Gramlich
#CS490-002 Project 2

import sys # import for taking the arguments (paths to input and output)
inputFile = sys.argv[1].strip(",") # path to input
outputFile = sys.argv[2] # path to output
file = open(inputFile, 'r') # opens input file
posLines = file.readlines() # reads input file
file.close() # closes input file
negLines = [] # empty array for store the data for output (negative .bed file)
previousEnd = 0 # variable for the end of a previous positve section to use for the start of the section
for line in posLines: # goes thru all the lines of the input
    parts = line.strip().split('\t') # splits the lines
    chromosome, start, end = parts[0], int(parts[1]), int(parts[2]) # place chromosome #, start index, and end index into variables
    if previousEnd >= start: continue # if the end of the previous section is greater than the start of the current section, it skips
    if previousEnd != 0: # if its not the start
        negStart = previousEnd + 1 # creates start of negative section from end of previous positive section
        negEnd = start - 1 # creates end of negative section from start of current positive section
        if negStart <= negEnd: # also if the end of the previous section is greater than the start of the current section, it skips
            negRegion = f"{chromosome}\t{negStart}\t{negEnd}" # creates line for the negative section
            negLines.append(negRegion) # adds it in the negative .bed file
    previousEnd = end # turns current end index into the previous end index for the next line
file = open(outputFile, 'w') # opens output file
for i in negLines: # go thru all the new negative lines
    file.write(i + '\n') # writes them in the negative .bed file
file.close() # closes output fil