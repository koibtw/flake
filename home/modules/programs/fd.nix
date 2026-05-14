{
  programs.fd = {
    enable = true;
    hidden = true;
    ignores = [
      ".git"
      ".jj"
      ".zig-cache"
      "zig-out"
      "target"
      "result"
      "bin"
      "build"
      "dist"
      "node_modules"
    ];
  };
}
