#!/bin/bash

cd ~

printf '\nUpdating & Upgrading...'
sleep 1
sudo apt update > /dev/null
sudo apt upgrade -y > /dev/null
sudo apt auto-remove -y> /dev/null

printf '\nInstalling useful tools...'
sleep 1
sudo apt install wget curl python3 net-tools git tilix python3 python3-all python3-pip gcc nasm gcc-multilib gdb -y
pip3 install pylint

printf '\nInstalling PEDA...'
sleep 1
git clone https://github.com/longld/peda.git ~/peda
echo "source ~/peda/peda.py" >> ~/.gdbinit

printf '\nInstalling fonts & colors...'
sleep 1
sudo wget https://github.com/ryanoasis/powerline-extra-symbols/raw/ae05de7c51f6609479f4f1a4a0f6f65631731c1b/src/PowerlineSymbols.otf -O /usr/share/fonts/opentype/PowerLineSymbols.otf
#sudo wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraMono/Regular/complete/Fura%20Mono%20Regular%20Nerd%20Font%20Complete%20Mono.otf -O /usr/share/fonts/opentype/Fura_Code_Regular_Nerd_Font_Complete_Mono.otf
sudo wget https://github.com/RnMor777/myconfigs/raw/main/Fura%20Code%20Regular%20Nerd%20Font%20Complete%20Mono.otf -O /usr/share/fonts/opentype/Fura_Code_Regular_Nerd_Font_Complete.Mono.otf
sudo fc-cache -v
sudo curl https://raw.githubusercontent.com/arcticicestudio/nord-tilix/develop/src/json/nord.json > /usr/share/tilix/schemes

printf '\nUpdating emulator...'
sleep 1
wget https://raw.githubusercontent.com/RnMor777/myconfigs/main/tilixbck.png -O .tilixbck.png
curl https://raw.githubusercontent.com/RnMor777/myconfigs/main/tilix.dconf > tilix.dconf
dconf load /com/gexperts/Tilix < tilix.dconf
rm tilix.dconf
dconf write /com/gexperts/Tilix/background-image "'`pwd`/.tilixbck.png'"
sudo update-alternatives --set x-terminal-emulator /usr/bin/tilix.wrapper

printf '\nInstalling Vim...'
sleep 1
sudo apt install vim -y
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
curl https://github.com/RnMor777/myconfigs/blob/main/.pylintrc > .pylintrc
curl https://raw.githubusercontent.com/RnMor777/myconfigs/main/.vimrc > .vimrc
vim +PluginInstall +qall

printf '\nInstalling zsh...'
sleep 1
#sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo apt install zsh -y
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
curl https://raw.githubusercontent.com/RnMor777/myconfigs/main/.zshrc > .zshrc
chsh -s $(which zsh)

source .zsh
reset
zsh
