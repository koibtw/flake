{
  networking = {
    hostName = "seber";
    firewall.allowedTCPPorts = [
      80
      443
    ];

    useDHCP = true;
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
}
