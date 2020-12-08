# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable colors and change prompt:
autoload -U colors && colors

# History in cache directory:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select

# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

precmd() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Spaceship prompt
autoload -U promptinit; promptinit
prompt spaceship

SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_CHAR_SYMBOL=❯
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_HG_SHOW=false
SPACESHIP_PACKAGE_SHOW=false
SPACESHIP_NODE_SHOW=false
SPACESHIP_RUBY_SHOW=false
SPACESHIP_ELM_SHOW=false
SPACESHIP_ELIXIR_SHOW=false
SPACESHIP_XCODE_SHOW_LOCAL=false
SPACESHIP_SWIFT_SHOW_LOCAL=false
SPACESHIP_GOLANG_SHOW=false
SPACESHIP_PHP_SHOW=false
SPACESHIP_RUST_SHOW=false
SPACESHIP_JULIA_SHOW=false
SPACESHIP_DOCKER_SHOW=false
SPACESHIP_DOCKER_CONTEXT_SHOW=false
SPACESHIP_AWS_SHOW=false
SPACESHIP_CONDA_SHOW=false
SPACESHIP_VENV_SHOW=false
SPACESHIP_PYENV_SHOW=false
SPACESHIP_DOTNET_SHOW=false
SPACESHIP_EMBER_SHOW=false
SPACESHIP_KUBECONTEXT_SHOW=false
SPACESHIP_TERRAFORM_SHOW=false
SPACESHIP_TERRAFORM_SHOW=false
SPACESHIP_VI_MODE_SHOW=false
SPACESHIP_JOBS_SHOW=false

#######################################
# Aliases
#######################################

# color output
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias ip='ip --color=auto'
alias ls='exa -lahFg --group-directories-first --git'

# mine
alias vim='nvim'
alias ssh='TERM=xterm-color ssh'
alias cat='bat'
alias kitty-xcolorgen="xrdb -query | grep '\*color\|\*foreground\|\*background\|\*cursorColor' | tr -d '*:' | sed 's/cursorColor/cursor/' > ~/.config/kitty/color.conf"
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'
alias rank-mirror='sudo reflector --verbose --latest 10 --sort rate --save /etc/pacman.d/mirrorlist'
alias startx='startx "$XDG_CONFIG_HOME/X11/xinitrc"'
alias xinitrc='$EDITOR $XDG_CONFIG_HOME/X11/xinitrc'
alias vimrc='$EDITOR $XDG_CONFIG_HOME/nvim/init.vim'
alias bashrc='$EDITOR ~/.bashrc'
alias zshrc='$EDITOR $XDG_CONFIG_HOME/zsh/.zshrc'
alias xresources='$EDITOR $XDG_CONFIG_HOME/X11/Xresources'
alias sxhkdrc='$EDITOR $XDG_CONFIG_HOME/sxhkd/sxhkdrc'
alias dunstrc='$EDITOR $XDG_CONFIG_HOME/dunst/dunstrc'
alias reflect-mirrors='sudo reflector --verbose --latest 10 --sort rate --save /etc/pacman.d/mirrorlist'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias lazyconfig='lazygit --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias win10='sudo mount /dev/sda4 /win10 && cd /win10/Users/drauk || cd /win10/Users/drauk'
alias ghidra="_JAVA_AWT_WM_NONREPARENTING=1 ghidra"

#######################################
# Plugins
#######################################

# Load Custom Keybindings
source ~/.config/zsh/keybindings.zsh 2>/dev/null

# Enable Mouse Support
source ~/.config/zsh/mouse.zsh 2>/dev/null

# Load extract function
source ~/.config/zsh/extract.zsh 2>/dev/null

# Load universal archive function
source ~/.config/zsh/archive.zsh 2>/dev/null

# Load zsh-autosuggestions
source ~/.config/zsh/zsh-autosuggestions.zsh 2>/dev/null

# Load zsh-syntax-highlighting
source ~/.config/zsh/zsh-syntax-highlighting.zsh 2>/dev/null

