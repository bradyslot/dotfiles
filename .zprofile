# Environment
export XDG_CURRENT_DESKTOP=Hyprland
export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=Hyprland

if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
    exec Hyprland
fi
