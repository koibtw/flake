{ inputs, ... }:
{
  imports = [ inputs.seberjune.nixosModules.default ];
  services.seberjune.enable = true;
}
