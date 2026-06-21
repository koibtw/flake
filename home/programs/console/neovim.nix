{ inputs, pkgs, ... }:
{
  imports = [ inputs.anvim.homeManagerModules.default ];

  programs.anvim = {
    enable = true;
    defaultEditor = true;
  };

  home.packages = [
    pkgs.bash-language-server
    pkgs.vscode-langservers-extracted # css, eslint, html, json
    pkgs.just-lsp
    pkgs.lua-language-server
    pkgs.nixd
    pkgs.tombi
    pkgs.yaml-language-server
  ];

  home.sessionVariables.MANPAGER = "nvim +Man!";
}
