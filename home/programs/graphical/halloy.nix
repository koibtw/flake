{ config, ... }:
let
  metadata = {
    realname = "june";
    metadata = {
      avatar = "https://koi.rip/img/silly/pfp.png";
      color = "#cbe3b3";
      display-name = "june";
      homepage = "https://koi.rip";
      pronouns = "they/them";
      status = "meowing :3";
    };
  };
in
{
  age.secrets.irc-password.file = ../../../secrets/irc-password.age;
  evergarden.halloy.enable = true;
  programs.halloy = {
    enable = true;
    settings = {
      font = {
        size = 15;
        family = "Maple Mono NF";
      };
      display = {
        adapt_metadata_colors = "all";
        decode_urls = true;
        nickname = [
          "display-name"
          "pronouns"
        ];
      };
      servers = {
        liberachat = {
          server = "irc.libera.chat";
          nickname = "junekot";
          queries = [ "robinwobin" ];
          monitor = [ "robinwobin" ];
          channels = [ "#neovim" ];
          sasl.plain = {
            username = "junekot";
            password_command = "cat ${config.age.secrets.irc-password.path}";
            disconnect_on_failure = true;
          };
        }
        // metadata;
        oftc = {
          server = "irc.oftc.net";
          nickname = "june";
          nick_password_command = "cat ${config.age.secrets.irc-password.path}";
          channels = [
            "#alpine-linux"
            "#alpine-devel"
            "#alpine-offtopic"
          ];
        }
        // metadata;
        rx = {
          server = "irc.runxiyu.org";
          nickname = "june";
          channels = [ "#chat" ];
        }
        // metadata;
      };
    };
  };
}
