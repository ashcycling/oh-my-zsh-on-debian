#!/bin/bash
sudo apt update
sudo apt upgrade -y
sudo apt install -y zsh fontconfig git
mkdir -p ~/.local/share/fonts
curl -L -o ~/.local/share/fonts/MesloLGS_NF_Regular.ttf  https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
curl -L -o ~/.local/share/fonts/MesloLGS_NF_Bold.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
curl -L -o ~/.local/share/fonts/MesloLGS_NF_Italic.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
curl -L -o ~/.local/share/fonts/MesloLGS_NF_Bold_Italic.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
fc-cache -f -v
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
curl -L -o ~/.p10k.zsh https://raw.githubusercontent.com/ashcycling/oh-my-zsh-on-debian/refs/heads/main/config/.p10k.zsh
curl -L -o ~/.zshrc https://raw.githubusercontent.com/ashcycling/oh-my-zsh-on-debian/refs/heads/main/config/.zshrc
