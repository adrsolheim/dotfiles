# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

##### CUSTOM KEYBINDS #####

# Replicate CTRL+u in bash
bindkey "^U" backward-kill-line


# Path to your oh-my-zsh installation.
export ZSH="$ZDOTDIR/.oh-my-zsh"

# Attempt at making Okular using system dark theme
QT_QPA_PLATFORMTHEME=gtk2

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="dpoggi"

ZSH_THEME_RANDOM_CANDIDATES=(
  "robbyrussell"
  "agnoster"
  "crunch"
  "darkblood"
  "dpoggi"
)


function cs () {
	if [ -z "$1" ]
	then
		echo "missing argument: directory"
		return
	fi

	toDir=$1
	ifs=$IFS
	IFS='/'
	read -A pathArr <<< "$PWD"
	i=$(( ${#pathArr[@]} -1 ))
	pos=-1
	while [[ i -ge 0 ]]
	do
		if [ "${pathArr[$i]}" = "${toDir}" ]; then
			pos=$i
			break
		fi
		(( i-- ))
	done
	if [ $pos -lt 0 ]; then
		echo "No such file or directory"
		return
	fi

	IFS=$ifs
	length=$pos
	subPath=${pathArr[@]:0:$length}
	newPath=${subPath[*]// //}

	cd $newPath
}


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git wd
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
autoload -U colors && colors


# Prompt
#PS1="%B%{$fg[yellow]%}[%{$fg[cyan]%}%n%{$fg[yellow]%}@%{$fg[magenta]%}%M %{$fg[green]%}%~$%{$fg[yellow]%}]%b "

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
    
alias hs='headset.sh'
alias rhs='sudo systemctl restart bluetooth'
alias vim='nvim'
alias vi='nvim'
alias dcu='sudo docker-compose up'
alias dcd='sudo docker-compose down'
alias cat='bat'
alias derby='java org.apache.derby.tools.ij'

    
# Default editor Vim    
export EDITOR=/usr/bin/nvim    

# ~/bin
export PATH=$HOME/bin:$PATH
# cargo
export PATH=$HOME/.local/bin:$HOME/.local/share/cargo/bin:$PATH
# npm install -g
export PATH=$HOME/bin/npm-global/bin:$PATH
# lastools
# export PATH=$HOME/bin/LAStools/bin:$PATH


# Derby DB
# export DERBY_INSTALL=/opt/Apache/db-derby-10.15.2.0-bin
# export DERBY_HOME=$DERBY_INSTALL
# export CLASSPATH=$DERBY_INSTALL/lib/derby.jar:$DERBY_INSTALL/lib/derbytools.jar:$DERBY_INSTALL/lib/derbyoptionaltools.jar:$DERBY_INSTALL/lib/derbyshared.jar:.



#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/adr/.other/.sdkman"
[[ -s "/home/adr/.other/.sdkman/bin/sdkman-init.sh" ]] && source "/home/adr/.other/.sdkman/bin/sdkman-init.sh"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/adr/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/adr/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/adr/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/adr/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


export PATH="$HOME/.poetry/bin:$PATH"

export SDKMAN_DIR="/home/adr/.other/.sdkman"
[[ -s "/home/adr/.other/.sdkman/bin/sdkman-init.sh" ]] && source "/home/adr/.other/.sdkman/bin/sdkman-init.sh"


export DERBY_HOME=/opt/derby_10
export PATH="$DERBY_HOME/bin:$PATH"


# pnpm
export PNPM_HOME="/home/adr/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
