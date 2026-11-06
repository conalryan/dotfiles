# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

source $ZSH/oh-my-zsh.sh

# Aliases
alias fzfp="fzf --height 40% --preview 'bat --style=numbers --color=always --line-range :500 {}'"
alias ls="ls -p -G"
alias pn="pnpm"

# exa replacement for ls
# exa [OPTIONS] [FILES]
alias l="exa -1ahl"
alias la="exa -1a"
alias lah="exa -1ah"
alias lahl="exa -1ahl"
alias lh="exa -1h"
alias lh="exa -1hl"

# Exports
export PATH="~/bin:$PATH"
export PATH="~/.local/bin:$PATH"
export PATH="/usr/local/bin:$PATH"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$NVM_DIR:$PATH"

# Rust
export RUST_HOME="$HOME/.cargo"
export PATH="$RUST_HOME/bin:$PATH"

# Swap
export SWAP="$HOME/.local/share/nvim/swap/"

# Fuzzy
# Setting rigpreg as the default source for fzf
export FZF_DEFAULT_COMMAND='rg --files'
# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Fish-like
source $ZSH/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH/custom/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source $ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=$ZSH/custom/plugins/zsh-syntax-highlighting/highlighters
