# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Operating System
OS=$(uname)

if [[ $OS = "Darwin" ]]
then
  export ZSH="$HOME/.oh-my-zsh"
  export ZSH_PLUGINS_DIR="/opt/homebrew/share"
  # export DOTNET_ROOT="/opt/homebrew/opt/dotnet@6/bin"
  export DOTNET_ROOT="/opt/homebrew/opt/dotnet@6/libexec"
  # export DOTNET_ROOT="/opt/homebrew/opt/dotnet/libexec"
  PATH="$DOTNET_ROOT:/opt/homebrew/Cellar/perl/5.36.1/bin:/Applications/Postgres.app/Contents/Versions/latest/bin:/opt/homebrew/opt/ruby/bin:/opt/homebrew/opt/openjdk/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:$HOME/bin:$HOME/.local/share/gem/bin:$HOME/.local/share/cargo/bin:$HOME/.local/bin:$HOME/.dotnet/tools:$PATH"
  if type brew &>/dev/null; then
    HOMEBREW_PREFIX=$(brew --prefix)
    for d in ${HOMEBREW_PREFIX}/opt/*/libexec/gnubin; do export PATH=$d:$PATH; done
    for d in ${HOMEBREW_PREFIX}/opt/*/libexec/gnuman; do export MANPATH=$d:$MANPATH; done
  fi
fi

if [[ $OS = "Linux" ]]
then
  export ZSH="/usr/share/oh-my-zsh"
  export ZSH_PLUGINS_DIR="/usr/share/zsh/plugins"

  if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
  fi

  export PATH="$HOME/bin:$GOPATH/bin:$HOME/.local/share/cargo/bin:$HOME/.local/bin:$PATH"
fi

# remove duplicates in paths
typeset -U PATH
typeset -U MANPATH

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

# Enable colors and change prompt:
autoload -U colors && colors

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
[[ ! -e ~/.cache/zsh/history ]] && touch ~/.cache/zsh/history

# disable insecure oh-my-zsh permissions warnings
ZSH_DISABLE_COMPFIX=true

source $ZSH/oh-my-zsh.sh
source $ZSH_PLUGINS_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH_PLUGINS_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh

plugins=(
  git
)

# disable automatic updates
zstyle ':omz:update' mode disabled

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select

# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zmodload zsh/complist
compinit -i
_comp_options+=(globdots) # Include hidden files.

# ======================================================================== WORK

WORK_ZSHRC="$HOME/src/onset/zshrc"
[[ -f $WORK_ZSHRC ]] && source $WORK_ZSHRC

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
alias less='less -R --mouse'

# mine
alias nvim='nvim'
alias vim='nvim'
alias vi='nvim'
alias ssh='TERM=xterm-color ssh'
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'
alias startx='startx "$XDG_CONFIG_HOME/X11/xinitrc"'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias win10='sudo mount /dev/sda4 /win10 && cd /win10/Users/drauk || cd /win10/Users/drauk'
alias ghidra="_JAVA_AWT_WM_NONREPARENTING=1 ghidra"
alias p="ps aux | head -1 && ps aux | grep -i"
alias wiki="awman"
alias virtualbox="GTK2_RC_FILES='' virtualbox"
alias enablev4l2="sudo modprobe v4l2loopback exclusive_caps=1 max_buffers=2"
alias startcam="gphoto2 --stdout --capture-movie | ffmpeg -i - -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 /dev/video2"
alias qsim="java -jar TinyClient.jar 192.168.90.250 password"
alias find-large-files='sudo su -c "find / -xdev -type f -size +100M -print | xargs ls -lh | sort -k5,5 -h -r"'
alias git-commit-previous='git commit --amend --no-edit'
alias screencast='/usr/lib/xdg-desktop-portal-wlr'
# eval "$(github-copilot-cli alias -- "$0")"

# =================================================================== FUNCTIONS

activate () {
  VENV_DIR=`basename "$(pwd)"`
  source ~/.venv/$VENV_DIR/bin/activate
}

ssh-pemgen () {
  ssh-keygen -P "" -t rsa -b 4096 -m pem -f "$1" -C "$1"
}

eval "$(starship init zsh)"
