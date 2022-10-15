# Install Homebrew (if not installed)
if [ ! -d  /usr/local/bin/brew ]; then
  echo "Installing Homebrew."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Make sure file permissions are correct
sudo chown -R $(whoami) /use/local/lib/pkgconfig
chmod u+w /usr/local/lib/pkgconfig

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
brew install --cask firefox
brew install google-chrome
brew install spotify
brew install --cask camtasia

## IDE ~like
brew install neovim
brew install --cask postman
brew install --cask visual-studio-code

## Lang
brew install --cask anaconda # install python + pacakges
brew install --cask docker
brew install maven
brew install node
brew install opendjdk
brew install rustup # then rustup-init
brew install rust-analyzer

## Shell
brew install --cask iterm2
brew install zsh

## Storage
brew install google-drive
brew install --cask sync

## Commandline ~Tools
brew install ack
brew install bat
brew install ctags
brew install exa
brew install fzf
brew install git
brew install httpie
brew install ripgrep
brew install rsync
brew install tree

# Remove outdated versions from the cellar.
brew cleanup
