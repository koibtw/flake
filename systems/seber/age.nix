{
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
