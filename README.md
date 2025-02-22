# Setup

```
ln -s ~/dotfiles/.zshrc ~/.config/zsh/.zshrc
ln -s ~/dotfiles/init.nvim ~/.config/nvim/init.vim
ln -s ~/dotfiles/treesitter.lua ~/.config/nvim/lua/config/treesitter.lua
ln -s ~/dotfiles/tmux.conf ~/.config/tmux/tmux.conf
```

### vim
Increase cursor speed on Mac (relog/restart for changes to take effect)
```
defaults write -g InitialKeyRepeat -int 10
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

### nvim

Vim-plugged
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Run inside `nvim`
```
:PlugInstall
```



### tmux

```
git clone https://github.com/tmux-plugins/tpm $XDG_CONFIG_HOME/tmux/plugins/tpm
```
