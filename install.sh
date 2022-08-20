#!/bin/bash

cd ~

printf '\nUpdating & Upgrading...\n'
sleep 1
sudo apt update
sudo apt upgrade -y
sudo apt auto-remove -y

printf '\nInstalling Packages...\n'
sleep 1
sudo apt install wget curl python3 net-tools git tilix python3 python3-all python3-pip gcc nasm gcc-multilib gdb htop -y
pip3 install pylint

printf '\nInstalling Fonts & Colors...\n'
sleep 1
sudo wget https://github.com/ryanoasis/powerline-extra-symbols/raw/ae05de7c51f6609479f4f1a4a0f6f65631731c1b/src/PowerlineSymbols.otf -O /usr/share/fonts/opentype/PowerLineSymbols.otf
sudo wget https://github.com/RnMor777/myconfigs/raw/main/Fura%20Code%20Medium%20Nerd%20Font%20Complete%20Mono.otf -O /usr/share/fonts/opentype/Fura_Code_Medium_Nerd_Font_Complete_Mono.otf
sudo fc-cache -v
sudo curl https://raw.githubusercontent.com/arcticicestudio/nord-tilix/develop/src/json/nord.json > /usr/share/tilix/schemes

printf '\nUpdating Emulator...\n'
sleep 1
wget https://raw.githubusercontent.com/RnMor777/myconfigs/main/tilixbck.png -O .tilixbck.png
wget https://raw.githubusercontent.com/RnMor777/myconfigs/main/tilixbck2.png -O .tilixbck2.png
curl https://raw.githubusercontent.com/RnMor777/myconfigs/main/tilix.dconf > tilix.dconf
dconf load /com/gexperts/Tilix/ < tilix.dconf
rm tilix.dconf
dconf write /com/gexperts/Tilix/background-image "'`pwd`/.tilixbck.png'"
sudo update-alternatives --set x-terminal-emulator /usr/bin/tilix.wrapper

printf '\nInstalling Vim...\n'
sleep 1
sudo apt install vim -y
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
curl https://raw.githubusercontent.com/RnMor777/myconfigs/main/.pylintrc > .pylintrc
curl https://raw.githubusercontent.com/RnMor777/myconfigs/main/.vimrc > .vimrc
vim +PluginInstall +qall

printf '\nInstalling Zsh...\n'
sleep 1
sudo apt install zsh -y
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo chsh -s $(which zsh)
curl https://raw.githubusercontent.com/RnMor777/myconfigs/main/.zshrc > .zshrc
source .zshrc
reset

echo -n "Install Malware Analysis/Extra Modules? (y/n): "
read answ
if [ $answ = 'y' ]
then
    curl https://raw.githubusercontent.com/RnMor777/myconfigs/main/extra.sh > extra.sh
    sudo chmod a+x extra.sh
    ./extra.sh
    rm extra.sh
fi
