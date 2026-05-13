{ pkgs, ... }:

{
  home.packages = with pkgs; [ jellyfin-rpc ];

  age.secrets.jellyfin-rpc.file = ../../../secrets/jellyfin-rpc.json.age;

  systemd.user.services.jellyfin-rpc = {
    Unit = {
      Description = "jellyfin discord RPC";
      After = [ "network.target" ];
    };

    Service = {
      ExecStart = "${pkgs.jellyfin-rpc}/bin/jellyfin-rpc -c /run/user/%U/agenix/jellyfin-rpc";
      Restart = "on-failure";
      RestartSec = 60;
    };

    # started manually with desktop session
    # Install.WantedBy = [ "default.target" ];
  };
}
