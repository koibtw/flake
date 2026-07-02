{
  lib,
  inputs,
  config,
  pkgs,
  ...
}:
let
  pfp = pkgs.fetchurl {
    url = "https://koi.rip/img/silly/pfp.png";
    hash = "sha256-fUt2WMefVUpCRqw1+kqw2ay6HfhphrfahlI9WfkOJjM=";
  };
in
{
  imports = [ inputs.washing-machien.nixosModules.default ];

  age.secrets.washing-machien-env.file = ../../../secrets/washing-machien.env.age;

  services.washing-machien = {
    enable = true;
    input = pfp;
    environmentFile = config.age.secrets.washing-machien-env.path;
  };

  systemd.timers.washing-machien.timerConfig.OnCalendar = lib.mkForce "*:0/4";
}
