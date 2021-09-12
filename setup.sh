#!/bin/bash

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     MACHINE=Linux;;
    Darwin*)    MACHINE=Mac;;
    CYGWIN*)    MACHINE=Cygwin;;
    MINGW*)     MACHINE=MinGw;;
    *)          MACHINE="UNKNOWN:${unameOut}"
esac

if [[ "$MACHINE" == "Linux" ]]
  then
    echo 'linux setup not yet configured'
elif [[ "$MACHINE" == "Mac" ]]
  then
    # source mac/setup.sh
    echo 'mac'
    # Install apps and binaries with Brew
    source brew_setup.sh

    # Set npm permissions and install global binaries
    # source shared/npm.sh

    # Configure MacOS defaults.
    # You only want to run this once during setup. Additional runs may reset changes you make manually.
    # source ./macos
fi
