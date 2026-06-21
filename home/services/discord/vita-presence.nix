{ pkgs, ... }:
let
  name = "vita-presence-the-server";
  package = pkgs.callPackage ./vita-presence-package.nix { };
  config = pkgs.runCommand "vita-presence-config" { } ''
        mkdir -p $out
        cat > $out/${name}.ini <<'EOF'
    [General]
    appID = 1509590848625578226
    vitaIP = 192.168.55.180
    updateTimer = 5000
    vitaTimeout = 5000
    EOF
  '';
in
{
  systemd.user.services.vita-presence = {
    Unit = {
      Description = "VitaPresence server";
      After = [ "network.target" ];
    };

    Service = {
      WorkingDirectory = config;
      ExecStart = "${package}/bin/${name}";
      Restart = "on-failure";
      RestartSec = 120;
    };

    # started by user-desktop.target
    # Install.WantedBy = [ "default.target" ];
  };
}
