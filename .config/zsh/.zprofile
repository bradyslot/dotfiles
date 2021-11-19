#######################################
# X11
#######################################
# if [[ "$(tty)" = "/dev/tty1" ]]; then
#     startx ~/.config/X11/xinitrc
# fi

#######################################
# Sway
#######################################

export SDL_VIDEODRIVER=wayland
export _JAVA_AWT_WM_NONREPARENTING=1
export QT_QPA_PLATFORM=wayland
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_DESKTOP=sway

if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
    exec sway
fi
