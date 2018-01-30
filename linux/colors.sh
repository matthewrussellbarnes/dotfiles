#!/bin/sh

## COLORS
VIM_COLORS_DIR=~/.vim/colors
TMP_DIR=~/install_tmp

# Set up Vim with Solarized

mkdir -p "$TMP_DIR" && cd "$TMP_DIR" && git clone git://github.com/altercation/vim-colors-solarized.git

mkdir -p "$VIM_COLORS_DIR" && cp "$TMP_DIR/vim-colors-solarized/colors/solarized.vim" "$VIM_COLORS_DIR/solarized.vim"

cd ~/ && rm -rf "$TMP_DIR"
