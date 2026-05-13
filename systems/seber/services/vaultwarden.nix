{ config, ... }:
{
  age.secrets.vaultwarden-env = {
    file = ../../../secrets/vaultwarden.env.age;
    owner = "vaultwarden";
  };

  services.vaultwarden = {
    enable = true;
    environmentFile = config.age.secrets.vaultwarden-env.path;
    config = {
      DOMAIN = "https://vault.koi.rip";
      SIGNUPS_ALLOWED = false;
      ROCKET_ADDRESS = "127.0.0.1";
      ROCKET_PORT = 8222;
      ROCKET_LOG = "critical";
      LOG_LEVEL = "warn";
    };
  };

  services.nginx.virtualHosts."vault.koi.rip" = {
    locations."/" = {
      proxyPass = "http://127.0.0.1:8222";
      extraConfig = ''
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_set_header Host $host;
      '';
    };
    forceSSL = true;
    sslCertificate = "/run/agenix/ssl-koi-cert";
    sslCertificateKey = "/run/agenix/ssl-koi-key";
  };
}
