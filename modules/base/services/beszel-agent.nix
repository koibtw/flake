{ config, ... }:
{
  age.secrets.beszel-token = {
    file = ../../../secrets/beszel-token.age;
    owner = "beszel-agent";
  };

  services.beszel.agent = {
    enable = true;
    environment = {
      DISK_USAGE_CACHE = "30m";
      HUB_URL = "https://beszel.leaffish-crocodile.ts.net";
      KEY = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII9RnAqtNcTtdMx7rzH1J3nsigG7EkBZop66OJEzemFl";
      TOKEN_FILE = config.age.secrets.beszel-token.path;
    };
  };
}
