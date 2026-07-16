{ pkgs, ... }:

{
  imports = [
    ./hardware.nix
    ./services
  ];

  boot.loader.grub = {
    enable = true;
    device = "/dev/vda";
  };

  time.timeZone = "UTC";
  i18n.defaultLocale = "en_US.UTF-8";

  networking = {
    hostName = "seber";
    firewall.allowedTCPPorts = [
      80
      443
    ];

    networkmanager.ensureProfiles.profiles."Wired connection 3" = {
      connection = {
        id = "Wired connection 3";
        type = "ethernet";
        interface-name = "ens5";
      };
      ipv6 = {
        method = "auto";
        addr-gen-mode = "eui64";
        ip6-privacy = 0;
      };
    };
  };

  environment.systemPackages = [
    pkgs.linuxquota
    pkgs.vim
    pkgs.htop
  ];

  system.activationScripts.quotas = {
    deps = [ ];
    text = ''
      echo
      ${pkgs.linuxquota}/bin/quotacheck -aumv || true
      ${pkgs.linuxquota}/bin/quotaon -auv || true
      for user in $(getent passwd | grep /var/ebil.club | cut -d: -f1); do
        echo "setting quota for $user"
        ${pkgs.linuxquota}/bin/setquota -u $user 8M 10M 0 0 / || true
      done
      echo
    '';
  };

  age = {
    identityPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
    secrets = {
      ssl-koi-cert = {
        file = ../../secrets/ssl-koi.cert.pem.age;
        mode = "0440";
        group = "nginx";
      };
      ssl-koi-key = {
        file = ../../secrets/ssl-koi.key.pem.age;
        mode = "0440";
        group = "nginx";
      };
      ssl-ebil-cert = {
        file = ../../secrets/ssl-ebil.cert.pem.age;
        mode = "0440";
        group = "nginx";
      };
      ssl-ebil-key = {
        file = ../../secrets/ssl-ebil.key.pem.age;
        mode = "0440";
        group = "nginx";
      };
    };
  };
}
