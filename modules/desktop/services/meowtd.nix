{ inputs, config, ... }:
{
  imports = [ inputs.meowtd.nixosModules.default ];
  services.meowtd = {
    enable = true;
    authorizedKeys =
      config.users.users.robin.openssh.authorizedKeys.keys
      ++ config.users.users.koi.openssh.authorizedKeys.keys;
  };
}
