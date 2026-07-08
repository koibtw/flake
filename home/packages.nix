{ pkgs, ... }:
{
  home.packages = [
    pkgs.nix-output-monitor
    pkgs.jellyfin-mpv-shim
    pkgs.jellyfin-tui
    pkgs.prettyping
    pkgs.playerctl
    pkgs.jq
    pkgs.gh
    pkgs.codeberg-cli

    pkgs.mumble
    pkgs.signal-desktop

    pkgs.inkscape
    pkgs.gimp

    (pkgs.olympus.override { celesteWrapper = "steam-run"; })

    pkgs.noto-fonts
    pkgs.noto-fonts-cjk-sans
    pkgs.noto-fonts-color-emoji
    pkgs.maple-mono.NF

    pkgs.inotify-tools
    pkgs.wl-clipboard

    pkgs.kitget
  ];
}
