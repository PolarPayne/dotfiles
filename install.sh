#!/bin/bash

set -e
set -o pipefail

pacman-key --init
pacman -Syu --noconfirm git

cd ~
if [ -d .dotfiles ]; then
    (cd .dotfiles; git pull;)
else
    git clone https://github.com/PolarPayne/dotfiles.git .dotfiles
fi
DOTFILES="$(pwd)/.dotfiles"

. "$DOTFILES/dotfiles.sh"
