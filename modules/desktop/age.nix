{ config, ... }:
{
  age.identityPaths = [ "${config.users.users.koi.home}/.ssh/id_ed25519" ];
}
