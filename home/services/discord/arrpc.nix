{
  services.arrpc = {
    enable = true;
    systemdTarget = "graphical-session.target";
  };

  systemd.user.services.arRPC = {
    Unit.Wants = [
      "jellyfin-rpc.service"
      "vita-presence.service"
    ];
  };
}
