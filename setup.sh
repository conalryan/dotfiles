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
    echo 'Setting up mac...'

    source ./lib/mac_setup.sh

    source ./lib/brew_setup.sh

    source ./lib/shell_setup.sh

    source ./lib/dotfile_setup.sh

    source ./lib/nvim_setup.sh

    source ./lib/node_setup.sh

    source ./lib/ssh_setup.sh
fi
