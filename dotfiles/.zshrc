export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(git)

source $ZSH/oh-my-zsh.sh

# --- ALIASES --------------------------------------------------------------

alias devcloud-curl='curl --cacert ~/.certs/LinodeDevCloudRoot-G1.crt' # devcloud-curl -XGET https://api.devcloud.linode.com/v4/regions | jq "."
alias fzfp="fzf --height 40% --preview 'bat --style=numbers --color=always --line-range :500 {}'"
alias ls="ls -p -G"
alias l="eza -1ahl" # eza replacement for ls
alias p="pnpm"
alias ssh='ghostty +ssh --'

# --- EXPORTS --------------------------------------------------------------

export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/bin:$PATH"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun" # bun completions

# Fish-like
source $ZSH/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH/custom/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh 
source $ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=$ZSH/custom/plugins/zsh-syntax-highlighting/highlighters

# Fuzzy
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
[ -f "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"

# fnm
export FNM_HOME="/opt/homebrew/bin/fnm"
export PATH="$FNM_HOME/bin:$PATH"
eval "$(fnm env --use-on-cd --shell zsh)"

# Rust
export RUST_HOME="$HOME/.cargo"
export PATH="$RUST_HOME/bin:$PATH"
export PATH="$(brew --prefix rustup)/bin:$PATH"

# Swap
export SWAP="$HOME/.local/share/nvim/swap/"
