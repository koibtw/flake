{ inputs, ... }:
{
  home = {
    username = "koi";
    homeDirectory = "/home/koi";
    stateVersion = "26.11";
  };

  imports = [
    ./modules/external.nix
    ./modules/xdg.nix
    ./modules/age.nix
    ./modules/theme.nix
    ./modules/packages.nix
    ./modules/wayland
    ./modules/programs

    inputs.evergarden.homeManagerModules.default
  ];

  evergarden = {
    enable = false;
    variant = "fall";
    accent = "green";
  };
}
