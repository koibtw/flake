{ pkgs, ... }:
{
  evergarden.adwaita.enable = true;

  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };

  home.pointerCursor = {
    enable = true;
    name = "Qogir";
    package = pkgs.qogir-icon-theme;
    size = 24;
    gtk.enable = true;
    x11.enable = false;
  };
}
