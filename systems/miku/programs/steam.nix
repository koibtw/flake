{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    extraPackages = [ pkgs.mangohud ];
    extraCompatPackages = [ pkgs.proton-ge-bin ];
    remotePlay.openFirewall = true;
  };
}
