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
   
    source brew_setup.sh

    source shell_setup.sh

    source config_setup.sh

    source nvim_setup.sh

    # As needed
    # source ssh_setup.sh
fi
