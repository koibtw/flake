{
  security.sudo.enable = false;

  security.doas = {
    enable = true;
    wheelNeedsPassword = true;
    extraRules = [
      {
        groups = [ "wheel" ];
        keepEnv = true;
        persist = true;
      }
      {
        groups = [ "wheel" ];
        cmd = "/run/current-system/sw/bin/nixos-rebuild";
        noPass = true;
      }
    ];
  };
}
