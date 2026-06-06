{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nix-output-monitor
    jellyfin-mpv-shim
    jellyfin-tui
    prettyping
    playerctl
    jq
    gh
    codeberg-cli

    mumble
    signal-desktop

    inkscape
    gimp

    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    maple-mono.NF

    inotify-tools
    wl-clipboard

    kitget
  ];
}
