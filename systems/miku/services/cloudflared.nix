{ pkgs, ... }:
{
  age.secrets.cloudflared.file = ../../../secrets/cloudflared.pem.age;
  systemd.services.cloudflared = {
    description = "cloudflare tunnel";
    after = [ "jellyfin.service" ];

    script = ''
      export TUNNEL_ORIGIN_CERT=/run/agenix/cloudflared

      cloudflared=${pkgs.cloudflared}/bin/cloudflared
      token=$($cloudflared tunnel token jelly)

      $cloudflared tunnel run --token $token
    '';

    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      Restart = "on-failure";
      RestartSec = 60;
    };
  };
}
