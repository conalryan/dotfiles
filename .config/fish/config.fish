# `set` to list all variables
# `set var "some value"`
# `set -e var` to erase variable
#
# Setting via the command line
# Note using set in command line will only be available in the current terminal instance.
#
# Note: using `export VAR="some value"` rather than `set VAR "some value"`
# so that the var will be available in `bash` scripts

set fish_greeting ""

# theme
set -gx TERM xterm-256color
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

set -g theme_nerd_fonts yes

# aliases
alias fzfp "fzf --height 40% --preview 'bat --style=numbers --color=always --line-range :500 {}'"
alias g git
alias l "ls -1a"
alias la "ls -A"
alias lh "ls -1ahl"
alias ll "ls -l"
alias ls "ls -p -G"
alias p3 "python3"

set -gx EDITOR nvim

# env
export P="$HOME/dev/p"
export T="$HOME/dev/t"
export W="$HOME/dev/w"

# path
set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH
set -gx PATH /usr/local/bin $PATH

# Anaconda
export ANACONDA_HOME=/usr/local/anaconda3
set -gx PATH ANACONDA_HOME/bin $PATH

# GO
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

# Java
export JAVA_HOME=(/usr/libexec/java_home)
set -gx PATH JAVA_HOME $PATH

# Maven
export MAVEN_HOME=/usr/local/bin/mvn
set -gx PATH $MAVEN_HOME/bin $PATH

# NVM
export NVM_DIR="$HOME/.nvm"
set -gx PATH $NVM_DIR $PATH

# Rust
export RUST_HOME="$HOME/.cargo"
set -gx PATH $RUST_HOME/bin $PATH

# Swap
export SWAP="$HOME/.local/share/nvim/swap/"

# Fuzzy
# Setting rigpreg as the default source for fzf
export FZF_DEFAULT_COMMAND='rg --files'

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
