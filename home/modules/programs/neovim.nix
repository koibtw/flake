{ inputs, pkgs, ... }:

{
  imports = [ inputs.anvim.homeManagerModules.default ];

  programs.anvim = {
    enable = true;
    defaultEditor = true;
  };

  home.packages = with pkgs; [
    bash-language-server
    vscode-langservers-extracted # css, eslint, html, json
    just-lsp
    lua-language-server
    nixd
    tombi
    yaml-language-server
  ];

  home.sessionVariables.MANPAGER = "nvim +Man!";
}
