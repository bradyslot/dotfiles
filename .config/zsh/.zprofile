if [[ "$(tty)" = "/dev/tty1" ]]; then
    startx "$XDG_CONFIG_HOME/X11/xinitrc"
fi


export PATH="/home/drauk/.local/share/cargo/bin:$PATH"
