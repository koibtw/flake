{ inputs, ... }:
{
  imports = [
    inputs.evergarden.nixosModules.default
  ];

  evergarden = {
    enable = false;
    variant = "fall";
    accent = "green";
  };
}
