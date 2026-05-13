{ pkgs, ... }:
{
  environment.localBinInPath = true;

  environment.systemPackages = [ pkgs.git ];
}
