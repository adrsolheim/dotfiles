### vim
Increase cursor speed on Mac (relog/restart for changes to take effect)
```
defaults write -g InitialKeyRepeat -int 6
defaults write -g KeyRepeat -int 2
```

### zsh

Directories referenced in config
```
~
├──  bin    user installed apps
└── .other  tools or configs
```

Each oh-my-zsh plugin listed in `.zshrc` will be loaded by zsh. Visit each plugin for setup instructions


### tmux

```
git clone https://github.com/tmux-plugins/tpm $XDG_CONFIG_HOME/tmux/plugins/tpm
```
