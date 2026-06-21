{ pkgs, ... }:
{
  home.packages = [ pkgs.jellyfin-rpc ];

  age.secrets.jellyfin-rpc.file = ../../../secrets/jellyfin-rpc.json.age;

  systemd.user.services.jellyfin-rpc = {
    Unit = {
      Description = "jellyfin discord RPC";
      After = [ "arRPC.service" ];
    };

    Service = {
      ExecStart = "${pkgs.jellyfin-rpc}/bin/jellyfin-rpc -c %t/agenix/jellyfin-rpc";
      Restart = "on-failure";
      RestartSec = 60;
    };
  };
}
