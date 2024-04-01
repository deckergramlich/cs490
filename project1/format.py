#Decker Gramlich
#CS490-002 Project 1

import sys # import for taking the argument (path to input)
inputFile = sys.argv[1] # path to input
file = open(inputFile, 'r') # opens input file
oldLines = file.readlines() # reads input file
file.close() # closes input file
newLines = [] # empty array for store the data for output
for i in range(1, len(oldLines), 2): # goes thru all the lines that have sequences (only the even lines, the odds ones had chromomsome #s so i skipped them)
    if len(oldLines[i]) >= 200 and oldLines[i] != "": # goes thru all the lines that have sequences that have length of 200 letters or more
        line = oldLines[i] # takes the line
        line = line[:200] # crops it down to 200 letters
        newLines.append(line) # adds it to new lines
if len(newLines) < 1000: x = len(newLines) 
else: x = 1000  # takes if it is 1000 lines or less
file = open(inputFile, 'w') # reopens input file
for i in range(0, x): # rewrites input file
    file.write(newLines[i] + '\n') # replaces old lines with new cropped lines
file.close() # closes input file