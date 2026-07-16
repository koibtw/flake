{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.brightnessctl
  ];
}
