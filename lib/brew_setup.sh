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
brew install --cask camtasia
brew install --cask gimp
brew install --cask inkscape
brew install --cask obsidian

# Browsers
brew install --cask firefox
brew install google-chrome

# DB

# mongodb https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-os-x/
# Start:
#   brew services start mongodb-community
# Stop:
#   brew services stop mongodb-community
# List:
#   brew services list
# List:
#   ps aux | grep -v grep | grep mongod
brew tap mongodb/brew
brew update
brew install mongodb-community

# mysql https://www.mysql.com/
# Start:
#   brew services start mysql
#   # or mysql.server start
# Setup:
#   mysqladmin -u root password 'secretpassword'
# Access:
#   mysql -u root -p
# Stop:
#   brew services stop mysql
#   # or mysql.server stop
brew install mysql

# postgress
# Start:
#   brew services start postgres
# Stop:
#   brew services stop postgres
# Verify:
#   postgres --verssion
#   psql --verssion
brew install postgresql # or postgresql@14

# redis https://developer.redis.com/create/homebrew/
# Start
#   redis-stack-server
# echo "export PATH=/usr/local/Caskroom/redis-stack-server/<VERSION>/bin:$PATH" >> ~/.zshrc
brew tap redis-stack/redis-stack
brew install --cask redis-stack

# Env
brew install --cask docker
brew install --cask vagrant

# IDE ~like
brew install neovim
brew install --cask postman
brew install --cask visual-studio-code
brew install --cask font-hack-nerd-font

# Lang
brew install --cask anaconda # install python + pacakges
brew install maven
# brew install node let nvm manage node
brew install opendjdk
brew install rustup # then rustup-init
brew install rust-analyzer
brew install wasm-pack

# Shell
brew install --cask iterm2
brew install zsh

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
brew install yarn

# Remove outdated versions from the cellar.
brew cleanup
