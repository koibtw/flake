{ inputs, ... }:
{
  home = {
    username = "koi";
    homeDirectory = "/home/koi";
    stateVersion = "26.11";
  };

  imports = [
    ./xdg.nix
    ./age.nix
    ./theme.nix
    ./packages.nix
    ./external
    ./wayland
    ./programs
    ./services

    inputs.evergarden.homeManagerModules.default
  ];

  evergarden = {
    enable = false;
    variant = "fall";
    accent = "green";
  };
}
