# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# oh-my-zsh settings
ZSH="/usr/share/oh-my-zsh/"

# distro packaged plugins dir
ZSH_PLUGINS_DIR="/usr/share/zsh/plugins"

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

# Source Environment
source ~/.zshenv
source $ZSH/oh-my-zsh.sh

# Enable colors and change prompt:
autoload -U colors && colors

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
[[ ! -e ~/.cache/zsh/history ]] && touch ~/.cache/zsh/history

# disable insecure oh-my-zsh permissions warnings
ZSH_DISABLE_COMPFIX=true

plugins=(
  git
)

zstyle :omz:plugins:ssh-agent lazy yes

source $ZSH_PLUGINS_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH_PLUGINS_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh

# disable automatic updates
zstyle ':omz:update' mode disabled

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select

# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files.

# source node version manager
# source /usr/share/nvm/init-nvm.sh

# ===================================================================== ALIASES


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
alias p="ps aux | head -1 && ps aux | grep -i"
alias wiki="awman"
alias virtualbox="GTK2_RC_FILES='' virtualbox"
alias enablev4l2="sudo modprobe v4l2loopback exclusive_caps=1 max_buffers=2"
alias startcam="sudo rmmod v4l2loopback; sudo modprobe v4l2loopback; gphoto2 --stdout --capture-movie | ffmpeg -i - -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 /dev/video0"
alias qsim="java -jar TinyClient.jar 192.168.90.250 password"
alias find-large-files='sudo su -c "find / -xdev -type f -size +100M -print | xargs ls -lh | sort -k5,5 -h -r"'
alias git-commit-previous='git commit --amend --no-edit'
alias screencast='/usr/lib/xdg-desktop-portal-wlr'
# eval "$(github-copilot-cli alias -- "$0")"

# =================================================================== FUNCTIONS

activate () {
  source ~/src/venv/$1/bin/activate
}

ssh-pemgen () {
  ssh-keygen -P "" -t rsa -b 4096 -m pem -f "$1" -C "$1"
}

eval "$(starship init zsh)"
