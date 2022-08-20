#!/bin/bash

cd ~

printf '\nInstalling Python Modules...\n'
sleep 1
pip3 install --upgrade numpy imagehash pefile peutils pillow networkx olefile

printf '\nInstalling Yara...\n'
sleep 1
sudo apt install yara -y

printf '\nInstalling Pepack...\n' 
sleep 1
sudo apt install pev -y

printf '\nInstalling Pecheck...\n'
sleep 1
curl https://raw.githubusercontent.com/DidierStevens/DidierStevensSuite/master/pecheck.py > .pecheck.py

printf '\nInstalling Oledump...\n'
sleep 1
curl https://raw.githubusercontent.com/DidierStevens/DidierStevensSuite/master/oledump.py > .oledump.py

#printf '\nInstalling Manalyze...\n'
#sleep 1
#sudo apt install libboost-regex-dev libboost-program-options-dev libboost-system-dev libboost-filesystem-dev libssl-dev build-essential cmake git -y
#git clone https://github.com/JusticeRage/Manalyze.git && cd Manalyze && cmake . && make -j5 && sudo make install && cd ..
#rm -rf Manalyze
