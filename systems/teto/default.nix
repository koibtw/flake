{ pkgs, ... }:

{
  imports = [ ./hardware.nix ];

  boot.loader.systemd-boot.enable = true;

  time.timeZone = "Europe/Warsaw";
  i18n.defaultLocale = "en_US.UTF-8";

  networking.hostName = "teto";

  services.xserver.xkb = {
    layout = "us";
  };

  environment.systemPackages = with pkgs; [
    brightnessctl
  ];
}
