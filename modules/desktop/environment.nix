{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.dnsmasq
    pkgs.htop
  ];
}
