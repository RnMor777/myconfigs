#!/bin/bash

cd ~

printf '\nInstalling Additonal Python Modules...\n'
exit
sleep 1
pip3 install --upgrade numpy imagehash pefile peutils pillow networkx olefile

printf '\nInstalling PEDA...\n'
sleep 1
git clone https://github.com/longld/peda.git ~/peda
echo "source ~/peda/peda.py" >> ~/.gdbinit

printf '\nInstalling Yara...\n'
sleep 1
sudo apt install yara -y

printf '\nInstalling Pepack...\n' 
sleep 1
sudo apt install pev -y

printf '\nInstalling Pecheck...\n'
sleep 1
curl https://raw.githubusercontent.com/DidierStevens/DidierStevensSuite/master/pecheck.py > .pecheck.py

printf '\nInstalling Oledump0.69...\n'
sleep 1
mkdir .oledump
cd .oledump
wget https://didierstevens.com/files/software/oledump_V0_0_69.zip
unzip oledump_V0_0_69.zip
rm oledump_V0_0_69.zip

printf '\nInstalling Wireshark...\n'
sleep 1
sudo apt install wireshark -y

printf '\nInstalling Suricata...\n'
sleep 1
sudo add-apt-repository ppa:oisf/suricata-stable
sudo apt update
sudo apt install suricata -y

printf '\nInstalling Manalyze...\n'
sleep 1
sudo apt install libboost-regex-dev libboost-program-options-dev libboost-system-dev libboost-filesystem-dev libssl-dev build-essential cmake git -y
git clone https://github.com/JusticeRage/Manalyze.git && cd Manalyze && cmake . && make -j5 && sudo make install && cd ..
rm -rf Manalyze
