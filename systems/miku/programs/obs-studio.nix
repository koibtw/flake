{ pkgs, ... }:
{
  programs.obs-studio.package = (pkgs.obs-studio.override { cudaSupport = true; });
}
