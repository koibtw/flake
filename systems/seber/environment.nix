{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.linuxquota
    pkgs.vim
    pkgs.htop
  ];
}
