#######################################
# Environment
#######################################

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source Environment
source ~/.config/zsh/.zshenv

# Enable colors and change prompt:
autoload -U colors && colors

# History in cache directory:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.cache/zsh/history
[[ ! -e ~/.cache/zsh/history ]] && touch ~/.cache/zsh/history

# disable insecure oh-my-zsh permissions warnings
ZSH_DISABLE_COMPFIX=true
# oh-my-zsh settings
export ZSH="$ZDOTDIR/.oh-my-zsh"

ZSH_THEME="spaceship"

plugins=(
  git
  # zsh-autocomplete
  zsh-autosuggestions
  # fast-syntax-highlighting
  zsh-syntax-highlighting
  # colored-man-pages
)

source $ZSH/oh-my-zsh.sh

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
# autoload -U promptinit; promptinit
# prompt spaceship

SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_CHAR_SYMBOL=">"
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_HG_SHOW=false
SPACESHIP_PACKAGE_SHOW=false
SPACESHIP_NODE_SHOW=false
SPACESHIP_ELM_SHOW=false
SPACESHIP_ELIXIR_SHOW=false
SPACESHIP_XCODE_SHOW_LOCAL=false
SPACESHIP_SWIFT_SHOW_LOCAL=false
SPACESHIP_RUBY_SHOW=false
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
# pipping server
alias send="curl -T - https://ppng.io/hD5w8JlHeUaI"
alias receive="curl https://ppng.io/hD5w8JlHeUaI"

# color output
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias ip='ip --color=auto'
alias ls='ls -lahv --color=auto --group-directories-first'
alias tree='tree -C'

# mine
alias nvim='nvim --listen localhost:6666'
alias vim='nvim --listen localhost:6666'
alias vi='nvim --listen localhost:6666'
alias ssh='TERM=xterm-color ssh'
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'
alias startx='startx "$XDG_CONFIG_HOME/X11/xinitrc"'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias lazyconfig='lazygit --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias win10='sudo mount /dev/sda4 /win10 && cd /win10/Users/drauk || cd /win10/Users/drauk'
alias ghidra="_JAVA_AWT_WM_NONREPARENTING=1 ghidra"
alias p="ps aux | grep -i"
alias wiki="awman"
alias virtualbox="GTK2_RC_FILES='' virtualbox"
alias enablev4l2="sudo modprobe v4l2loopback exclusive_caps=1 max_buffers=2"
alias startcam="gphoto2 --stdout --capture-movie | ffmpeg -i - -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 /dev/video0"
alias qsim="java -jar TinyClient.jar 192.168.90.250 password"
alias find-large-files='sudo su -c "find / -xdev -type f -size +100M -print | xargs ls -lh | sort -k5,5 -h -r"'
alias git-commit-previous='git commit --amend --no-edit'
alias screencast='/usr/lib/xdg-desktop-portal-wlr'

ssh-pemgen () {
    ssh-keygen -P "" -t rsa -b 4096 -m pem -f "$1" -C "$1"
}

#######################################
# Plugins
#######################################
# Load Completions Scripts
# fpath=(~/.config/zsh/completions $fpath)

# # Load Custom Keybindings
# source ~/.config/zsh/keybindings.zsh 2>/dev/null

# # Enable Mouse Support
source ~/.config/zsh/mouse.zsh 2>/dev/null

# Load extract function
source ~/.config/zsh/extract.zsh 2>/dev/null

# Load universal archive function
source ~/.config/zsh/archive.zsh 2>/dev/null

# # Load zsh-autosuggestions
# source ~/.config/zsh/zsh-autosuggestions.zsh 2>/dev/null

# # Load zsh-syntax-highlighting
# source ~/.config/zsh/zsh-syntax-highlighting.zsh 2>/dev/null
#

