{ inputs, pkgs, ... }:
{
  imports = [
    inputs.niri.nixosModules.niri
  ];

  programs.niri = {
    enable = true;
    package = pkgs.niri-stable;
  };

  environment.systemPackages = [ pkgs.xwayland-satellite ];
}
