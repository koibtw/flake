{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    dnsmasq
    htop
  ];
}
