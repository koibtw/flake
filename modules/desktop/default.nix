{ config, ... }:
{
  imports = [
    ./boot.nix
    ./console.nix
    ./nixpkgs.nix
    ./environment.nix
    ./virtualisation.nix
    ./evergarden.nix
    ./users.nix
    ./programs
    ./services

    ../home.nix
  ];

  age.identityPaths = [ "${config.users.users.koi.home}/.ssh/id_ed25519" ];
}
