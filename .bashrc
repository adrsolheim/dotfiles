# .bashrc

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

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/adr/.sdkman"
[[ -s "/home/adr/.sdkman/bin/sdkman-init.sh" ]] && source "/home/adr/.sdkman/bin/sdkman-init.sh"
