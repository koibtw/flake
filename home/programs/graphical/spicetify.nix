{ inputs, pkgs, ... }:
let
  spicePkgs = inputs.spicetify.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  imports = [ inputs.spicetify.homeManagerModules.spicetify ];
  evergarden.spicetify.enable = true;
  programs.spicetify = {
    enable = true;
    wayland = true;
    enabledExtensions = with spicePkgs.extensions; [
      catJamSynced
      fullAlbumDate
      songStats
      adblock
    ];
  };
}
