# zsh
source $XDG_CONFIG_HOME/zsh/.zshrc

# .bashrc

# Development variables
source ~/.other/dev.rc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
PATH="$HOME/.local/bin:$HOME/bin:/home/adr/.npm-global/bin:$PATH"
#export PATH=$PATH:$JAVA_HOME/bin
# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
PS1="[\u@\h \[\e[;;32m\]\$(dirs +0)\[\e[m\]]$ "

# Custom aliases
alias ..='cd ..'
alias vim='/usr/bin/nvim'

# Custom settings
HISTSIZE=1000
HISTFILESIZE=2000



# XDG Base Directory
# User directories
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
# System directories
export XDG_CONFIG_DIRS=/etc/xdg

# Cargo
export CARGO_HOME="$XDG_DATA_HOME"/cargo
# npm
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
# less
export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history



# Default editor Vim
export EDITOR=/usr/bin/nvim


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/adr/.other/.sdkman"
[[ -s "/home/adr/.other/.sdkman/bin/sdkman-init.sh" ]] && source "/home/adr/.other/.sdkman/bin/sdkman-init.sh"


