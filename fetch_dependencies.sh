#!/bin/bash

# System dependencies for vim plugins (for DNF-based systems)
# Plugins themselves are managed by vim-plug (see vimrc)

echo "Installing system dependencies..."

# Python >= 3.12 - required by YouCompleteMe
# Check if default python3 is >= 3.12, otherwise install python3.12 explicitly
PYTHON_VERSION=$(dnf info python3 2>/dev/null | grep "^Version" | head -1 | awk '{print $3}')
PYTHON_MAJOR=$(echo "$PYTHON_VERSION" | cut -d. -f1)
PYTHON_MINOR=$(echo "$PYTHON_VERSION" | cut -d. -f2)

if [ "$PYTHON_MAJOR" -gt 3 ] || { [ "$PYTHON_MAJOR" -eq 3 ] && [ "$PYTHON_MINOR" -ge 12 ]; }; then
    echo "Default python3 is version $PYTHON_VERSION (>= 3.12), using it"
    sudo dnf install -y python3 python3-devel
else
    echo "Default python3 is version $PYTHON_VERSION (< 3.12), installing python3.12 explicitly"
    sudo dnf install -y python3.12 python3.12-devel
    sudo dnf install -y python3.12-pip
fi

# YouCompleteMe build dependencies
sudo dnf install -y make clang automake gcc gcc-c++ cmake go

# Clangd - language server for C/C++
sudo dnf install -y clang-tools-extra

# Search tools - used by ack.vim
sudo dnf install -y ack the_silver_searcher

# ALE linters
sudo dnf install -y ShellCheck
if [ "$PYTHON_MAJOR" -gt 3 ] || { [ "$PYTHON_MAJOR" -eq 3 ] && [ "$PYTHON_MINOR" -ge 12 ]; }; then
    sudo pip3 install pylint
else
    sudo pip3.12 install pylint
fi

echo "Done! Now open vim and run :PlugInstall to install plugins"

