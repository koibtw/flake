{
  pkgs,
  ...
}:

{
  imports = [
    ./hardware.nix
    ./services
    ./programs
  ];

  boot.loader.systemd-boot.enable = true;

  time.timeZone = "Europe/Warsaw";
  i18n.defaultLocale = "en_US.UTF-8";

  networking.hostName = "miku";

  services.xserver.xkb = {
    layout = "us";
  };

  environment.systemPackages = with pkgs; [
    prismlauncher
    (retroarch.withCores (
      cores: with cores; [
        gpsp
        gambatte
        genesis-plus-gx
        fceumm
        snes9x
        desmume
        melonds
        flycast
        dolphin
        ppsspp
        beetle-psx
        mupen64plus
      ]
    ))
  ];
}
