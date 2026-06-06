{ pkgs, ... }:
{
  age.secrets.cloudflared.file = ../../../secrets/cloudflared.pem.age;
  systemd.services.cloudflared = {
    description = "cloudflare tunnel";
    after = [ "jellyfin.service" ];
    wantedBy = [ "multi-user.target" ];

    path = [ pkgs.cloudflared ];

    script = ''
      export TUNNEL_ORIGIN_CERT=/run/agenix/cloudflared

      cloudflared=${pkgs.cloudflared}/bin/cloudflared
      token=$($cloudflared tunnel token jelly)

      $cloudflared tunnel run --protocol http2 --token $token
    '';

    serviceConfig = {
      Restart = "on-failure";
      RestartSec = 60;
    };
  };
}
