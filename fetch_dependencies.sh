#!/bin/bash

if [ ! -d  ~/.vim/ ]; then
    mkdir ~/.vim/
fi

if [ ! -d  ~/.vim/plugin/ ]; then
    mkdir ~/.vim/plugin/
fi

if [ ! -d  ~/vimrc/vim-fswitch ]; then
    git clone https://github.com/derekwyatt/vim-fswitch.git
    ln -s ~/vimrc/vim-fswitch/plugin/fswitch.vim ~/.vim/plugin/fswitch.vim
else
    cd  ~/vimrc/vim-fswitch
    git pull
    cd -
fi

if [ ! -d  ~/vimrc/minibufexpl.vim ]; then
    git clone https://github.com/fholgado/minibufexpl.vim.git
    ln -s ~/vimrc/minibufexpl.vim/plugin/minibufexpl.vim ~/.vim/plugin/minibufexpl.vim
else
    cd  ~/vimrc/minibufexpl.vim
    git pull
    cd -
fi

