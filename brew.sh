#!/bin/bash

if [ $1 == "update" ]; then
    cd "$(brew --repo)"
    git remote set-url origin https://mirrors.ustc.edu.cn/brew.git
    cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
    git remote set-url origin https://mirrors.ustc.edu.cn/homebrew-core.git
    echo 'export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles' >> ~/.zshrc
    source ~/.zshrc
    brew update
elif [ $1 == "origin" ]; then
    cd "$(brew --repo)"
    git remote set-url origin https://github.com/Homebrew/brew.git
    cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
    git remote set-url origin https://github.com/Homebrew/homebrew-core.git
    sed -i -e '/bottles/d' ~/.zshrc 
    source ~/.zshrc
    brew update
fi
