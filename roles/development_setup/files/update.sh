#!/usr/bin/env sh

set -e -u -x

# download latest visual studio code package
curl --proto "=https" -X GET -L "https://code.visualstudio.com/sha/download?build=stable&os=linux-x64" -o /tmp/vscode-linux-x64.tar.gz

# extract the downloded application tar
mkdir -p ~/.local/apps
tar -C ~/.local/apps -xvf /tmp/vscode-linux-x64.tar.gz
rm /tmp/vscode-linux-x64.tar.gz

# install symlink in discoverable PATH
ln -sf ~/.local/apps/VSCode-linux-x64/bin/code ~/.local/bin/code
