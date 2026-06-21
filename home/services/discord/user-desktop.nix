{
  systemd.user.targets.user-desktop = {
    Unit = {
      Description = "started with desktop session";
      Wants = [
        "jellyfin-rpc.service"
        "vita-presence.service"
      ];
    };
  };
}
