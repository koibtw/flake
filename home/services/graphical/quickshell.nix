{ pkgs, ... }:
{
  home.packages = [ pkgs.kdePackages.qtdeclarative ]; # lsp and stuff
  programs.quickshell = {
    enable = true;
    systemd.enable = true;
  };
}
