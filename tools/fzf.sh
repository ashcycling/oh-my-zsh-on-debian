#!/bin/sh
# curl -LO https://github.com/junegunn/fzf/releases/download/v0.71.0/fzf-0.71.0-linux_amd64.tar.gz
# tar -xzf fzf-0.71.0-linux_amd64.tar.gz
# sudo mv fzf /usr/local/bin/fzf --version
# rm fzf-0.71.0-linux_amd64.tar.gz
# Установка/обновление последней версии fzf
fzf_ver=$(curl -s  "https://api.github.com/repos/junegunn/fzf/tags" | jq -r '.[0].name' | sed 's/^v//')
# echo $fzf_ver
curl -sfLO https://github.com/junegunn/fzf/releases/download/v$fzf_ver/fzf-$fzf_ver-linux_amd64.tar.gz
tar -xzf fzf-$fzf_ver-linux_amd64.tar.gz > /dev/null 2>&1
sudo mv fzf /usr/local/bin/fzf > /dev/null 2>&1
rm fzf-$fzf_ver-linux_amd64.tar.gz > /dev/null 2>&1
# curl -LO https://deckhouse.ru/downloads/deckhouse-cli/$d8_ver/d8-$d8_ver-darwin-arm64.tar.gz
# tar -xvf "d8-$d8_ver-darwin-arm64.tar.gz" "darwin-arm64/bin/d8"
# sudo mv "darwin-arm64/bin/d8" /usr/local/bin/
