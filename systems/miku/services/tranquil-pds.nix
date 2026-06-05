{ inputs, config, ... }:
{
  imports = [ inputs.tranquil-pds.nixosModules.tranquil-pds ];
  disabledModules = [ "services/web-apps/tranquil-pds.nix" ];

  age.secrets.tranquil-env = {
    file = ../../../secrets/tranquil.env.age;
    owner = "tranquil-pds";
  };

  nix.settings = {
    substituters = [ "https://tranquil.cachix.org" ];
    trusted-public-keys = [
      "tranquil.cachix.org-1:PoO+mGL6a6LcJiPakMDHN4E218/ei/7v2sxeDtNkSRg="
    ];
  };

  services.tranquil-pds = {
    enable = true;
    database.createLocally = true;
    environmentFiles = [ config.age.secrets.tranquil-env.path ];
    user = "tranquil-pds";
    settings = {
      server = {
        host = "127.0.0.1";
        port = 8830;
        hostname = "pds.ebil.club";
        max_blob_size = 1073741824; # 1 GiB
        user_handle_domains = [ ];
        age_assurance_override = true;
        invite_code_required = true;
      };
      moderation = {
        report_service_url = "https://ozone.wizardry.systems";
        report_service_did = "did:plc:yfklixyvt4y3irrkdb4mtvqn";
      };
      email = {
        from_address = "noreply@koi.rip";
        from_name = "ebil.club PDS";
        smarthost = {
          host = "smtp.purelymail.com";
          tls = "starttls";
          port = 587;
        };
      };
    };
  };
}
