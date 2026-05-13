if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  systemctl --user start jellyfin-rpc.service &
  exec niri-session
fi

if [ -z "$KITTY_WINDOW_ID" ]; then
  export FF_NO_KITGET=1
fi
