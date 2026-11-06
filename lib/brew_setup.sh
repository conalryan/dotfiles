#!/bin/bash

# Install Homebrew (if not installed)
if [ ! -d  /usr/local/bin/brew ]; then
  echo "Installing Homebrew."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "--- Permissions ---"
# Make sure file permissions are correct
sudo chown -R $(whoami) /use/local/lib/pkgconfig
chmod u+w /usr/local/lib/pkgconfig

echo "--- Update ---"
# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install Casks
brew tap homebrew/cask

echo "--- Install ---"

# Apps
brew install spotify
brew install --cask figma
brew install --cask obsidian
brew install --cask slack

# Browsers
brew install --cask firefox
brew install google-chrome

# Env
brew install --cask docker

# Terminal
brew install --cask warp
brew install --cask ghostty

# Shell
brew install zsh

# IDE ~like
brew install neovim
brew install --cask postman
brew install --cask visual-studio-code

brew tap homebrew/cask-fonts
brew install --cask font-fira-code-nerd-font
brew install --cask font-hack-nerd-font
brew install --cask font-meslo-lg-nerd-font
brew install --cask font-noto-nerd-font
brew install --cask font-ubuntu-nerd-font

# Node
brew install fnm

# Storage
brew install google-drive
brew install --cask sync

# Commandline ~Tools
brew install ack
brew install bat
brew install ctags
brew install exa
brew install fzf
brew install git
brew install httpie
brew install http-server
brew install ripgrep
brew install rsync
brew install tree

# Remove outdated versions from the cellar.
brew cleanup
