#!/bin/bash

# Install Homebrew (if not installed)
if [ ! -d  /usr/local/bin/brew ]; then
  echo "Homebrew already removed"
  exit
fi

echo "--- Uninstall ---"

# Apps
brew uninstall spotify
brew uninstall --cask obsidian

# Browsers
brew uninstall --cask firefox
brew uninstall google-chrome

# Env
brew uninstall --cask docker

# Terminal
brew uninstall --cask ghostty

# Shell
brew uninstall zsh

# IDE ~like
brew uninstall neovim
brew uninstall --cask postman
brew uninstall --cask visual-studio-code

brew uninstall --cask font-fira-code-nerd-font
brew uninstall --cask font-hack-nerd-font
brew uninstall --cask font-meslo-lg-nerd-font
brew uninstall --cask font-noto-nerd-font
brew uninstall --cask font-ubuntu-nerd-font

# Node
brew uninstall fnm

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
