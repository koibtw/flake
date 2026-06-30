{
  programs.fd = {
    enable = true;
    hidden = true;
    ignores = [
      ".git"
      ".jj"
      ".zig-cache"
      "zig-out"
      "zig-pkg"
      "target"
      "result"
      "bin"
      "build"
      "dist"
      "node_modules"
    ];
  };
}
