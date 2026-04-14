#!/bin/sh
curl -LO https://github.com/junegunn/fzf/releases/download/v0.71.0/fzf-0.71.0-linux_amd64.tar.gz
tar -xzf fzf-0.71.0-linux_amd64.tar.gz
sudo mv fzf /usr/local/bin/fzf --version
rm fzf-0.71.0-linux_amd64.tar.gz