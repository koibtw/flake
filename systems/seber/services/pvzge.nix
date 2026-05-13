{ pkgs, ... }:
let
  root = "/var/pvzge";
  upstream = "https://github.com/Gzh0821/pvzge_web.git";
  branch = "master";
in
{
  services.nginx.virtualHosts."pvzge.june.xn--q9jyb4c" = {
    locations."/".root = "${root}/docs";
    forceSSL = true;
    sslCertificate = "/run/agenix/ssl-ebil-cert";
    sslCertificateKey = "/run/agenix/ssl-ebil-key";
  };

  systemd.timers.pvzge-update = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "weekly";
      Unit = "pvzge-update.service";
    };
  };

  systemd.services.pvzge-update = {
    description = "update pvzge files";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.git ];
    serviceConfig = {
      Type = "oneshot";
      User = "koi";
      Group = "nginx";
      WorkingDirectory = root;
    };
    script = ''
      if [[ -d .git ]]; then
        ${pkgs.git}/bin/git pull --ff-only ${upstream} ${branch}
      else
        ${pkgs.git}/bin/git clone --branch=${branch} --depth=1 ${upstream} .
      fi
    '';
  };

  systemd.tmpfiles.rules = [ "d ${root} 2750 koi nginx -" ];
}
