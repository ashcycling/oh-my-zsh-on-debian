- [oh-my-zsh-on-debian](#oh-my-zsh-on-debian)
  - [How to install script](#how-to-install-script)
  - [install zsh](#install-zsh)
  - [install oh-my-zsh](#install-oh-my-zsh)
  - [Custom .zshrc](#custom-zshrc)
  - [Errors after zsh install and adding custom .zshrc](#errors-after-zsh-install-and-adding-custom-zshrc)
  - [install fzf-tab](#install-fzf-tab)
  - [install zsh-autosuggestions](#install-zsh-autosuggestions)
  - [install zsh-syntax-highlighting](#install-zsh-syntax-highlighting)
  - [install fonts for powerlevel10k](#install-fonts-for-powerlevel10k)
  - [install powerlevel10k](#install-powerlevel10k)

# oh-my-zsh-on-debian

## How to install script

```bash
sh -c "$(curl -fsSL https://github.com/ashcycling/oh-my-zsh-on-debian/raw/refs/heads/main/omzsh.sh)"
```

## install zsh

```bash
sudo apt update
sudo apt upgrade -y
sudo apt install -y zsh
```

## install oh-my-zsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Custom .zshrc

add link to .zshrc in repo

## Errors after zsh install and adding custom .zshrc

```bash
zsh
[oh-my-zsh] plugin 'fzf-tab' not found
[oh-my-zsh] plugin 'zsh-autosuggestions' not found
[oh-my-zsh] plugin 'zsh-syntax-highlighting' not found
[oh-my-zsh] theme 'powerlevel10k/powerlevel10k' not found
```


## install fzf-tab

```bash
# ???? sudo apt install fzf
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
```

## install zsh-autosuggestions

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

## install zsh-syntax-highlighting

```bash
# ??? sudo apt install -y zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

## install fonts for powerlevel10k

```bash
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts/
curl -L -o ~/.local/share/fonts/MesloLGS_NF_Regular.ttf  https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
curl -L -o ~/.local/share/fonts/MesloLGS_NF_Bold.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
curl -L -o ~/.local/share/fonts/MesloLGS_NF_Italic.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
curl -L -o ~/.local/share/fonts/MesloLGS_NF_Bold_Italic.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
fc-cache -f -v
```


## install powerlevel10k

```bash install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
```

