{ config, ... }:
{
  age.secrets.tailscale-auth.file = ../../../secrets/tailscale-auth.age;

  services.tailscale = {
    enable = true;
    authKeyFile = config.age.secrets.tailscale-auth.path;
  };
}
