#!/bin/bash

BASE_DIR=~/.vim/pack/yuvalif/start

mkdir -p $BASE_DIR

# fswitch: jump from implementation to header
if [ ! -d  $BASE_DIR/vim-fswitch ]; then
    cd $BASE_DIR || exit
    git clone https://github.com/derekwyatt/vim-fswitch.git
else
    cd  $BASE_DIR/vim-fswitch || exit
    git pull
fi

# minimal buffer explorer
if [ ! -d  $BASE_DIR/minibufexpl.vim ]; then
    cd $BASE_DIR || exit
    git clone https://github.com/fholgado/minibufexpl.vim.git
else
    cd  $BASE_DIR/minibufexpl.vim || exit
    git pull
fi

# YCM auto-completion
if [ ! -d  $BASE_DIR/YouCompleteMe ]; then
    cd $BASE_DIR || exit
    git clone https://github.com/Valloric/YouCompleteMe
    sudo dnf install -y make clang automake gcc gcc-c++ kernel-devel cmake
    sudo dnf install -y go
    sudo dnf install -y python-devel python3-devel
    cd  $BASE_DIR/YouCompleteMe || exit
    git submodule update --init --recursive
else
    cd  $BASE_DIR/YouCompleteMe || exit
    git pull
    git submodule update --init --recursive
fi

# build YCM
# TODO: only if newly cloned or git pull updated anything
./install.py --clang-completer --go-completer

# YCM generator
if [ ! -d  $BASE_DIR/YCM-Generator ]; then
    cd $BASE_DIR || exit
    git clone https://github.com/rdnetto/YCM-Generator.git
fi

# Git
if [ ! -d  $BASE_DIR/vim-gitgutter ]; then
    cd $BASE_DIR || exit
    git clone https://github.com/airblade/vim-gitgutter.git
else
    cd  $BASE_DIR/vim-gitgutter || exit
    git pull
fi

if [ ! -d  $BASE_DIR/vim-fugitive ]; then
    cd $BASE_DIR || exit
    git clone https://github.com/tpope/vim-fugitive
else
    cd  $BASE_DIR/vim-fugitive || exit
    git pull
fi

# status line
if [ ! -d  $BASE_DIR/vim-airline ]; then
    cd $BASE_DIR || exit
    git clone https://github.com/vim-airline/vim-airline.git
else
    cd  $BASE_DIR/vim-airline || exit
    git pull
fi

if [ ! -d  $BASE_DIR/vim-airline-themes ]; then
    cd $BASE_DIR || exit
    git clone https://github.com/vim-airline/vim-airline-themes.git
else
    cd  $BASE_DIR/vim-airline-themes || exit
    git pull
fi

# search tools
if [ ! -d  $BASE_DIR/ack.vim ]; then
    cd $BASE_DIR || exit
    git clone https://github.com/mileszs/ack.vim.git
    sudo dnf install -y ack
    sudo dnf install -y the_silver_searcher
else
    cd  $BASE_DIR/ack.vim || exit
    git pull
fi

# ale - async linter
if [ ! -d  $BASE_DIR/ale ]; then
    cd $BASE_DIR || exit
    git clone https://github.com/w0rp/ale
    sudo dnf install -y ShellCheck
    sudo pip install pylint
else
    cd  $BASE_DIR/ale || exit
    git pull
fi

# dir diff
if [ ! -d  $BASE_DIR/vim-dirdiff ]; then
    cd $BASE_DIR || exit
    git clone https://github.com/will133/vim-dirdiff
else
    cd  $BASE_DIR/vim-dirdiff || exit
    git pull
fi

# highlight current line
if [ ! -d  $BASE_DIR/conoline.vim ]; then
    cd $BASE_DIR || exit
    git clone https://github.com/miyakogi/conoline.vim
else
    cd  $BASE_DIR/conoline.vim || exit
    git pull
fi

# bookmarks
if [ ! -d  $BASE_DIR/vim-bookmarks ]; then
    cd $BASE_DIR || exit
    git clone https://github.com/MattesGroeger/vim-bookmarks.git
else
    cd  $BASE_DIR/vim-bookmarks || exit
    git pull
fi

# trailing whitespace
if [ ! -d  $BASE_DIR/trailertrash.vim ]; then
    cd $BASE_DIR || exit
    git clone https://github.com/csexton/trailertrash.vim
else
    cd  $BASE_DIR/trailertrash.vim || exit
    git pull
fi

