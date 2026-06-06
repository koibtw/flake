{ pkgs, ... }:
{
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      input-overlay
      obs-vkcapture
      obs-pipewire-audio-capture
    ];
  };
}
