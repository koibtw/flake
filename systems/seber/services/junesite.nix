{
  systemd.services.junesite = {
    description = "meow";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      ExecStart = "/var/junesite/junesite/bin/junesite";
      WorkingDirectory = "/var/junesite";
      Restart = "on-failure";
      RestartSec = 10;
    };
  };

  services.nginx.virtualHosts."june.xn--q9jyb4c" = {
    locations."/".proxyPass = "http://127.0.0.1:8282";
    forceSSL = true;
    sslCertificate = "/run/agenix/ssl-koi-cert";
    sslCertificateKey = "/run/agenix/ssl-koi-key";
  };

  systemd.tmpfiles.rules = [ "d /var/junesite 2750 koi users -" ];
}
