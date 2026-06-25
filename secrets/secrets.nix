let
  koi = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID9feAlrIVPuVS28tz54/m7pZkjHHL5aVhV2qwBPPceT" ];
  seber = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBAp82e57ij5x+Ei1Tjwxuex0fil5vV9wfEfNYgC5dFQ" ];
in
{
  "irc-rx.pem.age".publicKeys = koi;
  "irc-password.age".publicKeys = koi;
  "jellyfin-rpc.json.age".publicKeys = koi;
  "washing-machien.env.age".publicKeys = koi;
  "cloudflared.pem.age".publicKeys = koi;

  "email-pass-me.age".publicKeys = koi;
  "email-pass-noreply.age".publicKeys = koi;

  "tailscale-auth.age".publicKeys = koi ++ seber;
  "beszel-token.age".publicKeys = koi ++ seber;

  "beszel.env.age".publicKeys = seber;
  "vaultwarden.env.age".publicKeys = seber;
  "ssl-koi.cert.pem.age".publicKeys = seber;
  "ssl-koi.key.pem.age".publicKeys = seber;
  "ssl-ebil.cert.pem.age".publicKeys = seber;
  "ssl-ebil.key.pem.age".publicKeys = seber;
}
