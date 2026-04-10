#!/bin/bash
# sudo apt-get update 
# sudo apt-get upgrade -y -qq
# sudo apt-get install zsh fontconfig git fzf -y -qq
# mkdir -p ~/.local/share/fonts
# curl -L -o ~/.local/share/fonts/MesloLGS_NF_Regular.ttf  https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
# curl -L -o ~/.local/share/fonts/MesloLGS_NF_Bold.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
# curl -L -o ~/.local/share/fonts/MesloLGS_NF_Italic.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
# curl -L -o ~/.local/share/fonts/MesloLGS_NF_Bold_Italic.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
# fc-cache -f -v
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
# # sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
# curl -L -o ~/.p10k.zsh https://raw.githubusercontent.com/ashcycling/oh-my-zsh-on-debian/refs/heads/main/config/.p10k.zsh
# curl -L -o ~/.zshrc https://raw.githubusercontent.com/ashcycling/oh-my-zsh-on-debian/refs/heads/main/config/.zshrc
OS_TYPE=$(uname -s)

if [ "$OS_TYPE" = "Linux" ]; then
    echo " 🐧   This is a Linux system."
    if [ -f /etc/os-release ]; then
        # Load the distribution data
        . /etc/os-release
        # echo "OS Name: $NAME"
        echo " 🖥️ ID: $ID" # e.g., ubuntu, fedora, arch
        if [ "$ID" != "ubuntu" ] && [ "$ID" != "debian" ]; then
            echo " 🚨   This script is designed for Debian-based distributions. Exiting."
            exit 1
        fi
        echo " 🏎️   Updating package lists and upgrading existing packages..."
        sudo apt-get update -qq >/dev/null 2>&1
        sudo apt-get upgrade -y -qq >/dev/null 2>&1
        echo " ✅ done"
        if [ "$ID" = "ubuntu" ]; then
            version=$(lsb_release -rs)
            if [ "$version" = "25.10" ]; then
                echo " 🪳 Your Ubuntu version is: $version with bug: https://github.com/Aloxaf/fzf-tab/issues/549"
                echo " 💉 Installing workaround for fzf-tab plugin..."
                sudo apt-get install coreutils-from-gnu coreutils-from-uutils- --allow-remove-essential -y > /dev/null
                echo " ✅ done"
                # -o APT-get::Get::Assume-Yes=true -o APT-get::Get::force-yes=true
            fi
        fi
    echo " 🏎️   Installing Zsh, Fontconfig, Git, and FZF..."
    sudo apt-get install zsh fontconfig git fzf -y -qq >/dev/null 2>&1
    echo " ✅ done"
    echo " 🏎️   Installing MesloLGS NF fonts..."
    mkdir -p ~/.local/share/fonts > /dev/null
    # curl -L -o ~/.local/share/fonts/MesloLGS_NF_Regular.ttf  https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf > /dev/null
    # curl -L -o ~/.local/share/fonts/MesloLGS_NF_Bold.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf > /dev/null
    # curl -L -o ~/.local/share/fonts/MesloLGS_NF_Italic.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf > /dev/null
    # curl -L -o ~/.local/share/fonts/MesloLGS_NF_Bold_Italic.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf > /dev/null
    # fc-cache -f -v > /dev/null

    FONT_URL="https://github.com/romkatv/powerlevel10k-media/raw/master"
    FONTS=(
        "MesloLGS%20NF%20Regular.ttf"
        "MesloLGS%20NF%20Bold.ttf"
        "MesloLGS%20NF%20Italic.ttf"
        "MesloLGS%20NF%20Bold%20Italic.ttf"
    )

    for font in "${FONTS[@]}"; do
        curl -fLso ~/.local/share/fonts/"${font//%20/ }" "$FONT_URL/$font"
    done

    fc-cache -f -v > /dev/null

    echo " ✅ done"
    echo " 🏎️   Installing Oh My Zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended >/dev/null 2>&1
    # sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    echo " ✅ done"
    echo " 🏎️   Installing Oh My Zsh plugins and themes..."
    git clone -q https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab 
    git clone -q https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions 
    git clone -q https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting 
    git clone -q --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" 
    echo " ✅ done"
    echo " 🏎️   Downloading configs for p10k and oh-my-zsh"
    curl -fsSL -o ~/.p10k.zsh https://raw.githubusercontent.com/ashcycling/oh-my-zsh-on-debian/refs/heads/main/config/.p10k.zsh
    curl -fsSL -o ~/.zshrc https://raw.githubusercontent.com/ashcycling/oh-my-zsh-on-debian/refs/heads/main/config/.zshrc
    echo " ✅ done"
    echo " 🎉   Installation complete! Running zsh"
    exec zsh
    else
        echo " 🚨   Could not find /etc/os-release"
    fi
elif [ "$OS_TYPE" = "Darwin" ]; then
    echo " 💻 This is macOS."
fi


