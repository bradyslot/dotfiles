if [ "$(tty)" = "/dev/tty1" ]; then
  if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
    echo "Starting X on tty1"
    exec startx /usr/bin/cinnamon-session
  fi
fi
