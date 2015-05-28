#!/bin/bash

DOT_FILES=( .zshrc .vimrc .gitconfig .bashrc .peco)
 
for file in ${DOT_FILES[@]}
do
    ln -sfb ~/dotfiles/$file ~/$file
done

