#!/bin/sh

TPM_DIR=~/.tmux/plugins/tpm

# Install/update tpm manager
mkdir -p "$TPM_DIR" && (git clone https://github.com/tmux-plugins/tpm "$TPM_DIR" || (cd "$TPM_DIR" && git pull origin master))
