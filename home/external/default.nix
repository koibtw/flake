let
  configs = ./config;
  scripts = ./scripts;
  cargoConfig = ./files/cargo.toml;
  npmConfig = ./files/npmrc;
in
{
  home.file = builtins.listToAttrs (
    map (name: {
      name = ".local/bin/${builtins.replaceStrings [ ".sh" ] [ "" ] name}";
      value = {
        source = scripts + "/${name}";
        executable = true;
      };
    }) (builtins.attrNames (builtins.readDir scripts))
    ++ [
      {
        name = ".cargo/config.toml";
        value = {
          source = cargoConfig;
        };
      }
      {
        name = ".npmrc";
        value = {
          source = npmConfig;
        };
      }
    ]
  );

  xdg.configFile = builtins.mapAttrs (name: _: {
    source = configs + "/${name}";
    recursive = true;
  }) (builtins.readDir configs);
}
