{ inputs, ... }:
{
  imports = [
    inputs.agenix.nixosModules.default

    ./boot.nix
    ./console.nix
    ./security.nix
    ./networking.nix
    ./environment.nix
    ./nixpkgs.nix
    ./nix.nix
    ./system.nix
    ./users
    ./programs
    ./services
  ];
}
