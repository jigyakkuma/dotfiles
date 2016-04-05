#!/bin/bash

DOT_FILES=( .zshrc .vimrc .dein.toml .dein_lazy.toml .gitconfig .bashrc .peco/config.json .byobu/status)
 
for file in ${DOT_FILES[@]}
do
    ln -sfb ~/dotfiles/$file ~/$file
done

