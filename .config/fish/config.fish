# ~/.config/fish/config.fish ~ ~/.bashrc
#
# `set` to list all variables
# `set var "some value"`
# `set -e var` to erase variable
#
# Setting via the command line
# Note using set in command line will only be available in the current terminal instance.
#
# Note: using `export VAR="some value"` rather than `set VAR "some value"` 
# so that the var will be available in `bash` scripts

# Aliases
#-------------------------------------------------------------------------------
alias graalvmjdk11 'set JAVA_HOME $GRAALVM_JAVA_11_HOME; and set PATH[1] $JAVA_HOME/bin'
alias jdk8 'set JAVA_HOME $JAVA_8_HOME; and set PATH[1] $JAVA_HOME/bin'
alias jdk11 'set JAVA_HOME $JAVA_11_HOME; and set PATH[1] $JAVA_HOME/bin'
alias jdk13 'set JAVA_HOME $JAVA_13_HOME; and set PATH[1] $JAVA_HOME/bin'

alias l 'ls -1a'
alias lh 'ls -1ahl'

# Env Vars
# ------------------------------------------------------------------------------

# set P $HOME/dev/code/p
export P="$HOME/dev/code/p"
export T="$HOME/dev/code/t"
export W="$HOME/dev/code/w"

# Bazel deps
export BAZEL_DEPS="/Users/cryan/dev/code/t/bazel-deps"

# binaryen
export BINARYEN="/Users/cryan/dev/code/t/binaryen"

# Go
export GOPATH="/Users/cryan/go"
# export compound go paths
# export GOPATH=$GOPATH:/Users/cryan/dev/code/

# graalVM
set GRAALVM_JAVA_11_HOME "/Library/Java/JavaVirtualMachines/graalvm-ce-java11-20.0.0/Contents/Home"
# export PATH=/Library/Java/JavaVirtualMachines/graalvm-ce-java11-20.0.0/Contents/Home/bin:"$PATH"
export GRAALVM_JAVA_11_HOME="$GRAALVM_JAVA_11_HOME"

# JAVA
# Use set in order to execute (), fish does not allow $()
set JAVA_8_HOME (/usr/libexec/java_home -v1.8)
set JAVA_11_HOME (/usr/libexec/java_home -v11)
set JAVA_13_HOME (/usr/libexec/java_home -v13)
# Now expose to `bash` scripts
export JAVA_8_HOME="$JAVA_8_HOME"
export JAVA_11_HOME="$JAVA_11_HOME"
export JAVA_13_HOME="$JAVA_13_HOME"
# Default to jdk8
export JAVA_HOME="$JAVA_8_HOME"

# JBOSS
export JBOSS_HOME="/Users/cryan/dev/server/jboss-eap-7.2.2"

# Maven
export M2_HOME="/Users/cryan/dev/software/apache-maven-3.6.2"

# Node
export NODE_HOME="/usr/local/bin/node"
export NPM_HOME="/usr/local/bin/npm"

# NVM
# @see .bashrc

# Python
export PYTHON_HOME="/usr/local/anaconda3/bin"
export PYTHON_2_HOME="/usr/bin/python2.7"

# Rust
export RUST_HOME="/Users/cryan/.cargo"

# Wabt
export WABT="/Users/cryan/dev/code/t/wabt"

# Path
#------------------------------------------------------------------------------ 
export PATH="$GOPATH:$JAVA_HOME/bin:$M2_HOME/bin:$PYTHON_HOME:$PYTHON_2_HOME:$RUST_HOME/bin:$PATH"

# set -g theme_nerd_fonts yes
# set -g theme_color_scheme solarized-dark
# set -g theme_newline_cursor yes
# set -g theme_title_display_user yes
# set -g theme_title_display_process yes
# set -g theme_display_cmd_duration yes

# oceanic-next
# Base16 Shell
# Uncommenting line below causes error in nvim terminal. shows strange rgb escaped values
# eval sh $HOME/.config/oceanic-next-shell/oceanic-next.dark.sh 
