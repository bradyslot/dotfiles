# path 
typeset -U PATH path
path=("$HOME/bin" "$HOME/.gem/ruby/2.7.0/bin" "$HOME/.local/bin" "$path[@]")
export PATH

# default apps
export VISUAL=nvim
export EDITOR=nvim
export BROWSER=brave
export TERMINAL=kitty
export WM=dwm
export PAGER=less
export VIDEO=vlc
export IMAGE=sxiv
export OPENER=xdg-open

# clean up home directory
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_DATA_HOME="$HOME"/.local/share
export XDG_RUNTIME_DIR="/run/user/$(id -u)"

# clean up non xdg conforming programs
export ZDOTDIR=$HOME/.config/zsh
export HISTFILE="$XDG_DATA_HOME"/zsh/history
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export LESSHISTFILE=-
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export PARALLEL_HOME="$XDG_CONFIG_HOME"/parallel
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export GOPATH="$XDG_DATA_HOME"/go
prefix=${XDG_DATA_HOME}/npm
cache=${XDG_CACHE_HOME}/npm
tmp=${XDG_RUNTIME_DIR}/npm
#init-module=${XDG_CONFIG_HOME}/npm/config/npm-init.js

# colorize things
export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export BAT_THEME="base16-snazzy"

# Base16 Snazzy theme for FZF
gen_fzf_default_opts() {
local color00='#282a36'
local color01='#34353e'
local color02='#43454f'
local color03='#78787e'
local color04='#a5a5a9'
local color05='#e2e4e5'
local color06='#eff0eb'
local color07='#f1f1f0'
local color08='#ff5c57'
local color09='#ff9f43'
local color0A='#f3f99d'
local color0B='#5af78e'
local color0C='#9aedfe'
local color0D='#57c7ff'
local color0E='#ff6ac1'
local color0F='#b2643c'
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS"\
" --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D"\
" --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C"\
" --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D"
}
gen_fzf_default_opts
