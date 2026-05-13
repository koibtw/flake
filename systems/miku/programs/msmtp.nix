{ config, ... }:
{
  age.secrets.email-pass-noreply = {
    file = ../../../secrets/email-pass-noreply.age;
    owner = "tranquil-pds";
  };
  programs.msmtp = {
    enable = true;
    accounts.default = {
      host = "smtp.purelymail.com";
      port = 587;
      auth = true;
      tls = true;
      tls_starttls = true;
      from = "noreply@koi.rip";
      user = "noreply@koi.rip";
      passwordeval = "cat ${config.age.secrets.email-pass-noreply.path}";
    };
  };
}
