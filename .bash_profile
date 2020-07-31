
# Aliases
#-------------------------------------------------------------------------------
alias graalvmjdk11='export JAVA_HOME=$GRAALVM_JAVA_11_HOME'
alias jdk8='export JAVA_HOME=$JAVA_8_HOME; export PATH=$JAVA_HOME/bin:$PATH'
alias jdk11='export JAVA_HOME=$JAVA_11_HOME; export PATH=$JAVA_HOME/bin:$PATH'
alias jdk13='export JAVA_HOME=$JAVA_13_HOME; export PATH=$JAVA_HOME/bin:$PATH'

alias l='ls -1a'
alias lh='ls -1ahl'

# Env Vars
# ------------------------------------------------------------------------------
export P="$HOME/dev/code/p"
export T="$HOME/dev/code/t"
export W="$HOME/dev/code/w"

# Bazel
export BUILDOZER="~/dev/software/bazelbuildtools/buildozer"
export BUILDIFIER="~/dev/software/bazelbuildtools/buildifier"
export UNUSED_DEPS="~/dev/software/bazelbuildtools/unused_deps"
export BAZEL_DEPS="/Users/cryan/dev/code/t/bazel-deps"

# Binaryen
export BINARYEN="$HOME/dev/code/t/binaryen"

# Go
export GOPATH="/Users/cryan/go"
# export compound go paths
# export GOPATH=$GOPATH:/Users/cryan/dev/code/

# graalVM
export GRAALVM_JAVA_11_HOME="/Library/Java/JavaVirtualMachines/graalvm-ce-java11-20.0.0/Contents/Home"
# export PATH=/Library/Java/JavaVirtualMachines/graalvm-ce-java11-20.0.0/Contents/Home/bin:"$PATH"
#export GRAALVM_JAVA_11_HOME="$GRAALVM_JAVA_11_HOME"

# JAVA
export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
export JAVA_11_HOME=$(/usr/libexec/java_home -v11)
export JAVA_13_HOME=$(/usr/libexec/java_home -v13)
# Default to jdk8
export JAVA_HOME="$JAVA_8_HOME"

# JBOSS
export JBOSS_HOME="/Users/cryan/dev/server/jboss-eap-7.3.1"

# Maven
export M2_HOME="/Users/cryan/dev/software/apache-maven-3.6.2"

# Node
export NODE_HOME="/usr/local/bin/node"
export NPM_HOME="/usr/local/bin/npm"

# NVM
# export NVM_DIR="$HOME/.nvm"
#   [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
#   [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Python
export PYTHON_HOME="/usr/local/anaconda3/bin"
export PYTHON_2_HOME="/usr/bin/python2.7"

# Rust
export RUST_HOME="/Users/cryan/.cargo"

# Wabt
export WABT="$HOME/dev/code/t/wabt"

# Path
#------------------------------------------------------------------------------ 
export PATH="$BUILDOZER:$BUILDIFIER:$UNUSED_DEPS:$GOPATH:$JAVA_HOME/bin:$M2_HOME/bin:$PYTHON_HOME:$PYTHON_2_HOME:$RUST_HOME/bin:$PATH"

# Display colors in Git
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# TODO
# set -g theme_nerd_fonts yes
# set -g theme_color_scheme solarized-dark
# set -g theme_newline_cursor yes
# set -g theme_title_display_user yes
# set -g theme_title_display_process yes
# set -g theme_display_cmd_duration yes

# oceanic-next
# Base16 Shell
# Uncommenting line below causes error in nvim terminal. shows strange rgb escaped values
eval sh $HOME/.config/oceanic-next-shell/oceanic-next.dark.sh

# ERROR ~/.fzf.bash (line 3): Missing end to balance this if statement
# if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
# [ -f ~/.fzf.bash ] && source ~/.fzf.bash

# iTerm2
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
# Set CLICOLOR if you want Ansi Colors in iTerm2 
# export CLICOLOR=1
# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color


