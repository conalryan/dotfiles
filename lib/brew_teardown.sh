#!/bin/bash

# Install Homebrew (if not installed)
if [ ! -d  /usr/local/bin/brew ]; then
  echo "Homebrew already removed"
  exit
fi

echo "--- Uninstall ---"

# Apps
brew uninstall spotify
brew uninstall --cask camtasia
brew uninstall --cask gimp
brew uninstall --cask inkscape
brew uninstall --cask obsidian

# Browsers
brew uninstall --cask firefox
brew uninstall google-chrome

# DB
brew uninstall mongodb-community
brew uninstall mysql
brew uninstall postgresql
brew uninstall --cask redis-stack

# Env
brew uninstall --cask docker
brew uninstall --cask vagrant

# IDE ~like
brew uninstall neovim
brew uninstall --cask postman
brew uninstall --cask visual-studio-code
brew uninstall --cask font-hack-nerd-font

# Lang
brew uninstall --cask anaconda # uninstall python + pacakges
brew uninstall maven
# brew uninstall node let nvm manage node
brew uninstall opendjdk
brew uninstall rustup # then rustup-init
brew uninstall rust-analyzer
brew uninstall wasm-pack

# Shell
brew uninstall --cask iterm2
brew uninstall zsh

# Storage
brew uninstall google-drive
brew uninstall --cask sync

# Commandline ~Tools
brew uninstall ack
brew uninstall bat
brew uninstall ctags
brew uninstall exa
brew uninstall fzf
brew uninstall git
brew uninstall httpie
brew uninstall http-server
brew uninstall ripgrep
brew uninstall rsync
brew uninstall tree
brew uninstall yarn

# Remove all unused deps
brew autoremove

# Remove outdated versions from the cellar.
brew cleanup
