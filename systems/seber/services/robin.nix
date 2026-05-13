{ lib, config, ... }:

let
  tls = {
    forceSSL = true;
    sslCertificate = "/run/agenix/ssl-ebil-cert";
    sslCertificateKey = "/run/agenix/ssl-ebil-key";
  };
in
{
  nix.settings.trusted-users = [ "robin" ];

  users = {
    groups.robin = { };
    users.robin = {
      hashedPassword = lib.mkForce "!";
      openssh.authorizedKeys.keys = lib.mkForce [
        "no-agent-forwarding,no-port-forwarding,no-pty,no-user-rc,no-X11-forwarding ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDeSHaoF0Qs1G8JO/enOo2vxzkvvOqAMZPG2DX7TgG8u"
      ];
    };
  };

  systemd.user.services.maivi = {
    description = "maivi :3";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];

    environment.MAIVI_PORT = "5452";

    unitConfig.ConditionUser = "robin";
    serviceConfig = {
      ExecStart = "${config.users.users.robin.home}/maivi";
      WorkingDirectory = "${config.users.users.robin.home}/.maivi";
      Restart = "on-failure";
      RestartSec = 20;
    };
  };

  systemd.tmpfiles.rules = [ "d ${config.users.users.robin.home}/.maivi 0750 robin users -" ];

  services.nginx.virtualHosts = {
    "robinwobin.dev" = (
      {
        locations."/" = {
          proxyPass = "http://127.0.0.1:5452";
          extraConfig = ''
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
            proxy_set_header Host $host;
          '';
        };
      }
      // tls
    );
    "start.robinwobin.dev" = (
      {
        locations = {
          "/" = {
            root = "/var/ebil.club/robin/start";
            index = "index.html";
            extraConfig = "try_files $uri $uri/ @fallback;";
          };
          "@fallback".return = "302 https://robinwobin.dev$request_uri";
        };
      }
      // tls
    );
    "robin.ebil.club" = (
      {
        locations."/".return = "307 https://robinwobin.dev$request_uri";
      }
      // tls
    );
  };
}
