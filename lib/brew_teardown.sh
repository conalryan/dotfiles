# Install Homebrew (if not installed)
if [ ! -d  /usr/local/bin/brew ]; then
  echo "Homebrew already removed"
  exit
fi

# Uninstall

## Apps
brew uninstall --cask firefox
brew uninstall google-chrome
brew uninstall spotify
brew uninstall --cask camtasia

## IDE ~like
brew uninstall neovim
brew uninstall --cask postman
brew uninstall --cask visual-studio-code

## Lang
brew uninstall --cask anaconda # uninstall python + pacakges
brew uninstall --cask docker
brew uninstall maven
brew uninstall node
brew uninstall opendjdk
brew uninstall rustup # then rustup-init
brew uninstall rust-analyzer

## Shell
brew uninstall --cask iterm2
brew uninstall zsh

## Storage
brew uninstall google-drive
brew uninstall --cask sync

## Commandline ~Tools
brew uninstall ack
brew uninstall bat
brew uninstall ctags
brew uninstall exa
brew uninstall fzf
brew uninstall git
brew uninstall httpie
brew uninstall ripgrep
brew uninstall rsync
brew uninstall tree

# Remove all unused deps
brew autoremove

# Remove outdated versions from the cellar.
brew cleanup
