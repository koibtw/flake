{ lib, config, ... }:
{
  services.beszel.agent = {
    extraPath = [ config.hardware.nvidia.package ];
    environment = {
      EXTRA_FILESYSTEMS = "sdb";
    };
  };

  # see https://github.com/NixOS/nixpkgs/pull/522405
  systemd.services.beszel-agent.serviceConfig.PrivateDevices = lib.mkForce false;
}
