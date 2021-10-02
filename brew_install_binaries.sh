# Install Homebrew (if not installed)
echo "Installing Homebrew."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install Casks
brew tap homebrew/cask

# Install

## Apps
brew install google-chrome
brew install google-drive
brew install spotify

## IDE
brew install --cask postman
brew install --cask visual-studio-code

## Lang
brew install --cask anaconda # install python + pacakges
brew install --cask docker
brew install go
brew install maven
brew install node
brew install opendJdk
brew install rustup # then rustup-init

## Shell
brew install --cask iterm2
brew install zsh

## Tools
brew install ack
brew install bat
brew install ctags
brew install exa
brew install fzf
brew install git
brew install httpie
brew install neovim
brew install ripgrep
brew install rsync
brew install tree

# Remove outdated versions from the cellar.
brew cleanup
