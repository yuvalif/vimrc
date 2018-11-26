#!/bin/bash

BASE_DIR=~/.vim/pack/yuvalif/start

mkdir -p $BASE_DIR


# fswitch: jump from implementation to header
if [ ! -d  $BASE_DIR/vim-fswitch ]; then
    cd $BASE_DIR
    git clone https://github.com/derekwyatt/vim-fswitch.git
else
    cd  $BASE_DIR/vim-fswitch
    git pull
fi

cd - > /dev/null

# minimal buffer explorer
if [ ! -d  $BASE_DIR/minibufexpl.vim ]; then
    cd $BASE_DIR
    git clone https://github.com/fholgado/minibufexpl.vim.git
else
    cd  $BASE_DIR/minibufexpl.vim
    git pull
fi

cd - > /dev/null

# tag window
if [ ! -d  $BASE_DIR/tagbar ]; then
    cd $BASE_DIR
    git clone https://github.com/majutsushi/tagbar.git
else
    cd  $BASE_DIR/tagbar
    git pull
fi

# YCM auto-completion
if [ ! -d  $BASE_DIR/YouCompleteMe ]; then
    cd $BASE_DIR
    git clone https://github.com/Valloric/YouCompleteMe
    sudo dnf install -y automake gcc gcc-c++ kernel-devel cmake
    sudo dnf install -y python-devel python3-devel
    cd  $BASE_DIR/YouCompleteMe
    git submodule update --init --recursive
else
    cd  $BASE_DIR/YouCompleteMe
    git pull
    git submodule update --init --recursive
fi

# build YCM
# TODO: only if newly cloned or git pull updated anything
#./install.py --clang-completer --go-completer
# TODO: build YCM fo C/C++
cd - > /dev/null

# Git
if [ ! -d  $BASE_DIR/vim-gitgutter ]; then
    cd $BASE_DIR
    git clone git://github.com/airblade/vim-gitgutter.git
else
    cd  $BASE_DIR/vim-gitgutter
    git pull
fi

# status line
if [ ! -d  $BASE_DIR/vim-airline ]; then
    cd $BASE_DIR
    git clone https://github.com/vim-airline/vim-airline.git
else
    cd  $BASE_DIR/vim-airline
    git pull
fi

