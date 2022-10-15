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
    echo 'linux teardown not yet configured'
elif [[ "$MACHINE" == "Mac" ]]
  then
    echo 'Tearing down mac...'

    source ./lib/brew_teardown.sh

    source ./lib/shell_teardown.sh

    source ./lib/dotfile_teardown.sh

    source ./lib/node_teardown.sh

    # As needed
    # source ./lib/ssh_teardown.sh
fi