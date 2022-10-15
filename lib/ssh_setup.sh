#!/bin/bash

DEPLOYED="`whoami`-deployed-`date +%Y-%m-%d`"
EXTERNAL="`whoami`-external-`date +%Y-%m-%d`"
INTERNAL="`whoami`-internal-`date +%Y-%m-%d`" 

# Generate
echo "Generating..."
ssh-keygen -t rsa -b 2048 -C $DEPLOYED -f ~/.ssh/$DEPLOYED
ssh-keygen -t rsa -b 2048 -C $EXTERNAL -f ~/.ssh/$EXTERNAL
ssh-keygen -t rsa -b 2048 -C $INTERNAL -f ~/.ssh/$INTERNAL

# Verify
echo "Verifying..."
ssh-keygen -l -E md5 -f ~/.ssh/$DEPLOYED
ssh-keygen -l -f ~/.ssh/$DEPLOYED
ssh-keygen -l -E md5 -f ~/.ssh/$EXTERNAL
ssh-keygen -l -f ~/.ssh/$EXTERNAL
ssh-keygen -l -E md5 -f ~/.ssh/$INTERNAL
ssh-keygen -l -f ~/.ssh/$INTERNAL

# Use
echo "Using..."
ssh-add ~/.ssh/$DEPLOYED
ssh-add ~/.ssh/$EXTERNAL
ssh-add ~/.ssh/$INTERNAL

# Config
echo "Host *
  UseKeychain yes
  AddKeysToAgent yes
  IdentityFile ~/.ssh/$INTERNAL" >> ~/.ssh/config

