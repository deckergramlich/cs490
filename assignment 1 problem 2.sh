#Decker Gramlich
#CS490
#assignment 1
#problem 2

if [ "$#" -ne 2 ]; then #check if the correct number of arguments is provided
    echo "Usage: $0 <source_directory> <destination_directory>"
    exit 1
fi
# Assign input arguments to variables
source_directory=$1
destination_directory=$2

if [ ! -d "$source_directory" ]; then #check if the source directory exists
    echo "Error: Source directory '$source_directory' not found."
    exit 1
fi
if [ ! -d "$destination_directory" ]; then #check if the destination directory exists, if not, create it
    mkdir -p "$destination_directory"
fi
cp -r "$source_directory"/* "$destination_directory" #copy files from source to destination

echo "Files copied successfully from $source_directory to $destination_directory" #print a message