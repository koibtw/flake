{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.prismlauncher
    (pkgs.retroarch.withCores (
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
