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

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Enable searching through history
bindkey '^R' history-incremental-pattern-search-backward

# Edit line in vim buffer ctrl-v
autoload edit-command-line; zle -N edit-command-line
bindkey '^v' edit-command-line

# Enter vim buffer from normal mode
autoload -U edit-command-line && zle -N edit-command-line && bindkey -M vicmd "^v" edit-command-line

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'left' vi-backward-char
bindkey -M menuselect 'down' vi-down-line-or-history
bindkey -M menuselect 'up' vi-up-line-or-history
bindkey -M menuselect 'right' vi-forward-char

# Fix backspace bug when switching modes
bindkey "^?" backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

# ci", ci', ci`, di", etc
autoload -U select-quoted
zle -N select-quoted
for m in visual viopp; do
  for c in {a,i}{\',\",\`}; do
    bindkey -M $m $c select-quoted
  done
done

# ci{, ci(, ci<, di{, etc
autoload -U select-bracketed
zle -N select-bracketed
for m in visual viopp; do
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $m $c select-bracketed
  done
done

zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}

zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
precmd() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

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

# Spaceship Prompt
autoload -U promptinit; promptinit
prompt spaceship

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
alias rank-mirror='sudo reflector --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist'
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
alias tmux='TERM=screen-256color tmux'

# pacman
alias pac='sudo pacman -S'     	 # install
alias pacu='sudo pacman -Syu' 	 # update, add 'a' to the list of letters to update AUR packages if you use yaourt
alias pacr='sudo pacman -Rs'  	 # remove
alias pacs='yay -Ss'     # search
alias paci='sudo pacman -Si'     # info
alias paclo='sudo pacman -Qdt'   # list orphans
alias pacro='pacman -Qdt && sudo pacman -Rns $(pacman -Qtdq)' # remove orphans
alias pacc='sudo pacman -Scc'    # clean cache
alias paclf='sudo pacman -Ql'    # list files

# search command line history
alias h="history | grep "

# search running processes
alias p="ps aux | grep "

# easily create archives
alias mktar='tar -cvf'
alias mkbz2='tar -cvjf'
alias mkgz='tar -cvzf'
alias mkzip='zip -r'

# show all logs in /var/log
alias logs="sudo find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f | bat --paging=never -l log"

#######################################
# Plugins
#######################################

# Load extract function
source ~/.config/zsh/extract.zsh 2>/dev/null

# Load universal archive function
source ~/.config/zsh/archive.zsh 2>/dev/null

# Load zsh-autosuggestions
source ~/.config/zsh/zsh-autosuggestions.zsh 2>/dev/null

# Load zsh-syntax-highlighting
source ~/.config/zsh/zsh-syntax-highlighting.zsh 2>/dev/null
