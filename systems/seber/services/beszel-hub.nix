{ config, ... }:
{
  age.secrets.beszel-env = {
    file = ../../../secrets/beszel.env.age;
    owner = "beszel-hub";
  };

  services.beszel.hub = {
    enable = true;
    port = 6767;
    host = "127.0.0.1";
    environmentFile = config.age.secrets.beszel-env.path;
  };

  services.tailscale.serve = {
    enable = true;
    services.beszel.endpoints."tcp:443" = "http://127.0.0.1:6767";
  };
}
