#!/usr/bin/env bash

set -e
set -o pipefail

cd "$(dirname $(readlink -f $0))"
ln -sf $PWD/tmux/tmux.conf.local ~/.tmux.conf.local
ln -sf $PWD/zsh/zshrc-linux ~/.zshrc
ln -sf $PWD/vim/vimrc ~/.vimrc

