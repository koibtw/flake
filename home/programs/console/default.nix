{
  imports = [
    # encryption
    ./gpg.nix

    # version control
    ./jujutsu.nix
    ./git.nix

    # shell
    ./zsh.nix
    ./zoxide.nix
    ./direnv.nix
    ./eza.nix

    # file management
    ./fd.nix
    ./fzf.nix

    # info
    ./cuteff.nix

    # text
    ./neovim.nix
    ./aerc.nix

    # network
    ./meowtd.nix
  ];
}
