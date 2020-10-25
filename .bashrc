#  _               _              
# | |__   __ _ ___| |__  _ __ ___ 
# | '_ \ / _` / __| '_ \| '__/ __|
# | |_) | (_| \__ \ | | | | | (__ 
# |_.__/ \__,_|___/_| |_|_|  \___|
                                
#######################################
# Exports
#######################################
export PATH="~/bin:$PATH"
export VISUAL=nvim
export EDITOR=nvim
export BROWSER=brave
export TERMINAL=kitty

# clean up home directory
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_DATA_HOME="$HOME"/.local/share
export XDG_RUNTIME_DIR="/run/user/$(id -u)"
export HISTFILE="$XDG_DATA_HOME"/bash/history
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history

# enable base16 shell colors 
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# colorise man pager with bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# colorise output of less command
export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

# prompt
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

#######################################
# Aliases
#######################################

# color output
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias ip='ip --color=auto'
alias ls='ls -lahF --g --color=auto'

# mine
alias vim='nvim'
alias ssh='TERM=xterm-color ssh'
alias cat='bat'
alias dp='xrandr --output DisplayPort-0 --preferred'
alias kitty-xcolorgen="xrdb -query | grep '\*color\|\*foreground\|\*background\|\*cursorColor' | tr -d '*:' | sed 's/cursorColor/cursor/' > ~/.config/kitty/color.conf"
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'
alias rank-mirror='sudo reflector --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist'
alias startx='startx "$XDG_CONFIG_HOME/X11/xinitrc"'
alias xinitrc='$EDITOR $XDG_CONFIG_HOME/X11/xinitrc'
alias vimrc='$EDITOR ~/.vimrc'
alias bashrc='$EDITOR ~/.bashrc'
alias xresources='$EDITOR $XDG_CONFIG_HOME/X11/Xresources'
alias sxhkdrc='$EDITOR $XDG_CONFIG_HOME/sxhkd/sxhkdrc'
alias dunstrc='$EDITOR $XDG_CONFIG_HOME/dunst/dunstrc'
alias reflect-mirrors='sudo reflector --verbose --latest 10 --sort rate --save /etc/pacman.d/mirrorlist'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

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

# alias chmod commands 
alias mx='chmod a+x'
alias 000='chmod -R 000'
alias 644='chmod -R 644'
alias 666='chmod -R 666'
alias 755='chmod -R 755'
alias 777='chmod -R 777'

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

# word processor
alias word="wordgrinder"

#######################################
# Functions
#######################################

# easily extract any archive
extract () {
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)	tar xvjf $1 && cd $(basename "$1" .tar.bz2) ;;
			*.tar.gz)	tar xvzf $1 && cd $(basename "$1" .tar.gz) ;;
			*.tar.xz)	tar Jxvf $1 && cd $(basename "$1" .tar.xz) ;;
			*.bz2)		bunzip2 $1 && cd $(basename "$1" /bz2) ;;
			*.rar)		unrar x $1 && cd $(basename "$1" .rar) ;;
			*.gz)		gunzip $1 && cd $(basename "$1" .gz) ;;
			*.tar)		tar xvf $1 && cd $(basename "$1" .tar) ;;
			*.tbz2)		tar xvjf $1 && cd $(basename "$1" .tbz2) ;;
			*.tgz)		tar xvzf $1 && cd $(basename "$1" .tgz) ;;
			*.zip)		unzip $1 && cd $(basename "$1" .zip) ;;
			*.Z)		uncompress $1 && cd $(basename "$1" .Z) ;;
			*.7z)		7z x $1 && cd $(basename "$1" .7z) ;;
			*)			echo "don't know how to extract '$1'..." ;;
		esac
	else
		echo "'$1' is not a valid file!"
	fi
}

# copy file with progress bar
copy() {
	set -e
	strace -q -ewrite cp -- "${1}" "${2}" 2>&1 | awk '{
	count += $NF
	if (count % 10 == 0) {
		percent = count / total_size * 100
		printf "%3d%% [", percent
		for (i=0;i<=percent;i++)
			printf "="
			printf ">"
			for (i=percent;i<100;i++)
				printf " "
				printf "]\r"
			}
		}
	END { print "" }' total_size=$(stat -c '%s' "${1}") count=0
}


HISTCONTROL=ignoreboth # no duplicates or space prepended entries
HISTSIZE= HISTFILESIZE= # infinite history

# append to the history file, don't overwrite it
shopt -s histappend # append to history file
shopt -s checkwinsize # resize output to window
shopt -s globstar # ** matches all in a pathname

# disable dpms and screenblanking
xset s off -dpms 2> /dev/null

# enable bash completion
if [ -f /usr/share/bash-completion/bash_completion ]; then
	. /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

# tab completion menu
set show-all-if-ambiguous on
set show-all-if-unmodified on
set menu-complete-display-prefix on
#bind 'TAB: menu-complete'
#bind '"\e[Z": menu-complete-backward'

# up and down arrows search history with characters before the cursor
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# enable colors in tab completion
set colored-stats on
set colored-completion-prefix on
