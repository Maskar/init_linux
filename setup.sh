#!/usr/bin/env bash

EXEC_HOME=$(dirname $0) # The folder that the script resides in

echo "Installing required packages..."
[[ ! -f $(command -v yum) ]] || sudo yum install -y util-linux-user zsh git curl
[[ ! -f $(command -v apt) ]] || sudo apt install -y zsh git curl

[[ $(command -v zsh) ]] || { echo "Install ZSH first!"; exit 1; }
[[ $(command -v curl) ]] || { echo "Install curl first!"; exit 1; }
[[ $(command -v git) ]] || { echo "Install git first!"; exit 1; }

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/MichaelAquilina/zsh-autoswitch-virtualenv.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/autoswitch_virtualenv

echo "Backup '.zshrc' as '.zshrc.bak'..."
cp $HOME/.zshrc $HOME/.zshrc.bak

echo "Set theme powerlevel10k..."
#echo "$(cat $HOME/init_linux/zshrc.top)"$'\n'"$(cat $HOME/.zshrc)" > $HOME/.zshrc
cp $EXEC_HOME/config/zshrc.top $HOME/.zshrc
cat $HOME/.zshrc.bak >> $HOME/.zshrc
cat $EXEC_HOME/config/zshrc.end >> $HOME/.zshrc
sed -i 's/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"powerlevel10k\/powerlevel10k\"/' $HOME/.zshrc

echo "Set plugins..."
sed -i 's/plugins=(git)/plugins=(safe-paste git zsh-completions zsh-autosuggestions zsh-syntax-highlighting)/' $HOME/.zshrc

echo "Copy settings..."
cp $EXEC_HOME/config/p10k.zsh $HOME/.p10k.zsh
