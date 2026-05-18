{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cloudflared
    dnsmasq
    htop
  ];
}
