# path
typeset -U PATH path
path=("$HOME/bin" "$HOME/.local/share/cargo/bin/" "$HOME/.gem/ruby/2.7.0/bin" "$HOME/.local/bin" "$path[@]")
export PATH

# locale
export LANG=en_AU.UTF-8

# default apps
export VISUAL=nvim
export EDITOR=nvim
export BROWSER=brave
export TERMINAL=alacritty
export WM=dwm
export PAGER=less
export VIDEO=vlc
export IMAGE=nomacs
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
export LESSHISTFILE=-
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export PARALLEL_HOME="$XDG_CONFIG_HOME"/parallel
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export GOPATH="$XDG_DATA_HOME"/go
prefix=${XDG_DATA_HOME}/npm
cache=${XDG_CACHE_HOME}/npm
tmp=${XDG_RUNTIME_DIR}/npm
init-module=${XDG_CONFIG_HOME}/npm/config/npm-init.js 2>/dev/null
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME"/android
export ANDROID_AVD_HOME="$XDG_DATA_HOME"/android/
export ANDROID_EMULATOR_HOME="$XDG_DATA_HOME"/android/
export ADB_VENDOR_KEY="$XDG_CONFIG_HOME"/androidmodule=${XDG_CONFIG_HOME}/npm/config/npm-init.js
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export MACHINE_STORAGE_PATH="$XDG_DATA_HOME"/docker-machine
export GEM_HOME="$XDG_DATA_HOME"/gem
export GEM_SPEC_CACHE="$XDG_CACHE_HOME"/gem
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup

export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket
export GDK_BACKEND=wayland

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
export BAT_THEME="base16"

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# Start Flavours
# Base16 vice
# Author: Thomas Leon Highbaugh thighbaugh@zoho.com

_gen_fzf_default_opts() {

local color00='#1F2023'
local color01='#23262C'
local color02='#313040'
local color03='#3A3F49'
local color04='#525d73'
local color05='#8b9cbe'
local color06='#B2BFD9'
local color07='#e9efff'
local color08='#ff9cff'
local color09='#796af5'
local color0A='#f0ee6e'
local color0B='#6c71c4'
local color0C='#00eaff'
local color0D='#00caff'
local color0E='#61aeee'
local color0F='#fc29a8'

export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS"\
" --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D"\
" --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C"\
" --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D"

}

_gen_fzf_default_opts
# End Flavours
