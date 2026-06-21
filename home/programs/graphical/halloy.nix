{ config, ... }:
{
  age.secrets.libera-password.file = ../../../secrets/libera-password.age;
  programs.halloy = {
    enable = true;
    settings = {
      font = {
        size = 15;
        family = "Maple Mono NF";
      };
      display = {
        decode_urls = true;
        nickname = [
          "display-name"
          "pronouns"
        ];
      };
      servers.liberachat = {
        server = "irc.libera.chat";
        nickname = "junekot";
        realname = "june";
        metadata = {
          color = "#cbe3b3";
          display-name = "june";
          homepage = "https://koi.rip";
          pronouns = "they/them";
        };
        queries = [ "robinwobin" ];
        monitor = [ "robinwobin" ];
        channels = [ "#neovim" ];
      };
      servers.liberachat.sasl.plain = {
        username = "junekot";
        password_command = "cat ${config.age.secrets.libera-password.path}";
        disconnect_on_failure = true;
      };
    };
  };
}
