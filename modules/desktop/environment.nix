{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cloudflared
    htop
  ];
}
