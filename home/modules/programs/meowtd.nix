{ inputs, config, ... }:
{
  imports = [ inputs.meowtd.homeManagerModules.default ];
  programs.meowtd = {
    enable = true;
    settings = {
      address = "bmo";
      auth.key.private = builtins.head config.age.identityPaths;
    };
  };
}
