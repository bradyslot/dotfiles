# Emacs keybindings are the standard for Bash and what I'm used to for the shell
bindkey -e
export KEYTIMEOUT=1

function zle-line-init {
    marking=0
}
zle -N zle-line-init

function select-char-right {
    if (( $marking != 1 ))
    then
        marking=1
        zle set-mark-command
    fi
    zle .forward-char
}
zle -N select-char-right

function select-char-left {
    if (( $marking != 1 ))
    then
        marking=1
        zle set-mark-command
    fi
    zle .backward-char
}
zle -N select-char-left

function select-word-right {
    if (( $marking != 1 ))
    then
        marking=1
        zle set-mark-command
    fi
    zle .forward-word
}
zle -N select-word-right

function select-word-left {
    if (( $marking != 1 ))
    then
        marking=1
        zle set-mark-command
    fi
    zle .backward-word
}
zle -N select-word-left

function forward-char {
    if (( $marking == 1 ))
    then
        marking=0
        NUMERIC=-1 zle set-mark-command
    fi
    zle .forward-char
}
zle -N forward-char

function backward-char {
    if (( $marking == 1 ))
    then
        marking=0
        NUMERIC=-1 zle set-mark-command
    fi
    zle .backward-char
}
zle -N backward-char

function forward-word {
    if (( $marking == 1 ))
    then
        marking=0
        NUMERIC=-1 zle set-mark-command
    fi
    zle .forward-word
}
zle -N forward-word

function backward-word {
    if (( $marking == 1 ))
    then
        marking=0
        NUMERIC=-1 zle set-mark-command
    fi
    zle .backward-word
}
zle -N backward-word

function delete-char {
    if (( $marking == 1 ))
    then
        zle kill-region
        marking=0
    else
        zle .delete-char
    fi
}
zle -N delete-char

function deselect-region {
    marking=0
    NUMERIC=-1 zle set-mark-command
}
zle -N deselect-region

copy-to-xclip() {
    [[ "$REGION_ACTIVE" -ne 0 ]] && zle copy-region-as-kill
    print -rn -- $CUTBUFFER | xclip -selection clipboard -i
}
zle -N copy-to-xclip

paste-xclip() {
    killring=("$CUTBUFFER" "${(@)killring[1,-2]}")
    CUTBUFFER=$(xclip -selection clipboard -o)
    zle yank
}
zle -N paste-xclip

bindkey '^[[1;2D' select-char-left
bindkey '^[[1;2C' select-char-right
bindkey '\E[1;6D' select-word-left
bindkey '\E[1;6C' select-word-right
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^P' paste-xclip
bindkey '^Y' copy-to-xclip
bindkey '\e' deselect-region

# Ctrl-Delete Delete whole word forward
bindkey '^[[3;5~' kill-word

# enable delete
bindkey '^[[3~' delete-char

# enable backspace
bindkey "^?" backward-delete-char

# Enable searching through history
bindkey '^R' history-incremental-pattern-search-backward
