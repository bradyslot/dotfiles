# path
typeset -U PATH path 

# Operating System
OS=$(uname)

if [[ $OS = "Darwin" ]]
then
  path=("/opt/homebrew/opt/findutils/libexec/gnubin" "/opt/homebrew/opt/coreutils/libexec/gnubin" "/opt/homebrew/bin" "/opt/homebrew/sbin" "/usr/local/bin" "$HOME/bin" "$HOME/.local/share/cargo/bin" "$HOME/.local/bin" "$path[@]")
  MANPATH="/opt/homebrew/opt/findutils/libexec/gnuman:/opt/homebrew/opt/coreutils/libexec/gnuman:$MANPATH"
  export MANPATH
  export PATH
fi

if [[ $OS = "Linux" ]]
then
  path=("$HOME/bin" "$HOME/.local/share/cargo/bin" "$HOME/.local/bin" "$path[@]")
  export PATH
fi

# fix ssh colors
# export TERM="xterm-256color"

# locale
export LANG=en_US.UTF-8

# default apps
export VISUAL=nvim
export EDITOR=nvim
export TERMINAL=alacritty

# clean up home directory
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_DATA_HOME="$HOME"/.local/share
export XDG_RUNTIME_DIR="/run/user/$(id -u)"

# clean up non xdg conforming programs
# export ZDOTDIR=$HOME/.config/zsh
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
export ANSIBLE_CONFIG="$XDG_CONFIG_HOME"/ansible
# export AWS_CONFIG_FILE="$XDG_CONFIG_HOME/aws/config"
# export AWS_CLI_HISTORY_FILE="$XDG_DATA_HOME/aws/history"
# export AWS_CREDENTIALS_FILE="$XDG_DATA_HOME/aws/credentials"
# export AWS_WEB_IDENTITY_TOKEN_FILE="$XDG_DATA_HOME/aws/token"
# export AWS_CREDENTIALS_FILE="$XDG_DATA_HOME/aws/credentials"
# export AWS_SHARED_CREDENTIALS_FILE="$XDG_DATA_HOME/aws/shared-credentials"
export QT_QPA_PLATFORM=wayland
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
if [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
    export MOZ_ENABLE_WAYLAND=1
fi
# program env variables
# export ZSH_CUSTOM=$HOME/.config/zsh/custom
export NVIM_LISTEN_ADDRESS=localhost:6666
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

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
# Base16 OneDark
# Scheme author: Lalit Magant (http://github.com/tilal6991)
# Template author: Tinted Theming (https://github.com/tinted-theming)

_gen_fzf_default_opts() {

local color00='#282c34'
local color01='#353b45'
local color02='#3e4451'
local color03='#545862'
local color04='#565c64'
local color05='#abb2bf'
local color06='#b6bdca'
local color07='#c8ccd4'
local color08='#e06c75'
local color09='#d19a66'
local color0A='#e5c07b'
local color0B='#98c379'
local color0C='#56b6c2'
local color0D='#61afef'
local color0E='#c678dd'
local color0F='#be5046'

export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS"\
" --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D"\
" --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C"\
" --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D"

}

_gen_fzf_default_opts
# End Flavours
