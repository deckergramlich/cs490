#Decker Gramlich
#CS490
#assignment 1
#problem 1

sudo apt-get update #update the system
sudo apt-get upgrade -y
sudo apt-get install htop -y #install htop
sudo apt-get install screen -y #install screen
#install miniconda
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh
~/miniconda3/bin/conda init bash

echo "System updated and installed htop, screen, and miniconda" #print a message