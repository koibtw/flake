{
  lib,
  modulesPath,
  ...
}:

{
  imports = [ (modulesPath + "/profiles/qemu-guest.nix") ];

  boot.initrd.availableKernelModules = [
    "ata_piix"
    "uhci_hcd"
    "virtio_pci"
    "sr_mod"
    "virtio_blk"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  boot.loader.grub = {
    enable = true;
    device = "/dev/vda";
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/9bc4dce8-4cbe-49e2-bd9f-12542c3361fe";
    fsType = "ext4";
    options = [
      "usrquota"
      "jqfmt=vfsv0"
    ];
  };

  swapDevices = [ { device = "/dev/disk/by-uuid/3a56df3a-5226-4016-8ba0-ddd979c60c8c"; } ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
