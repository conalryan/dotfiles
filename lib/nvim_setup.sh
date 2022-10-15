#!/bin/bash

# Dep manager https://github.com/savq/paq-nvim
git clone --depth=1 https://github.com/savq/paq-nvim.git \
    "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/paqs/start/paq-nvim

# lsp
npm install -g typescript-language-server typescript
pip install pyright