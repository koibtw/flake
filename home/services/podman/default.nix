{
  services.podman = {
    enable = true;
    builds.meowpine.file = toString ./Containerfile;
  };
}
