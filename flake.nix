{
  description = "my nixos flake :3";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    anvim = {
      url = "git+https://git.koi.rip/koi/anvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    cuteff = {
      url = "git+https://codeberg.org/koibtw/cuteff";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    meowtd = {
      url = "git+https://git.koi.rip/koi/meowtd.git";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    seberjune = {
      url = "git+https://git.koi.rip/koi/seberjune.git";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    evergarden = {
      url = "git+https://codeberg.org/evergarden/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        nixpkgs-stable.follows = "nixpkgs";
      };
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake/beta";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    washing-machien = {
      url = "git+https://tangled.org/did:plc:nz5npphohxgjo2blfipdatam/washing-machien";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
        home-manager.follows = "home-manager";
      };
    };
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      inherit (nixpkgs) lib;
      system = "x86_64-linux";

      mkHost =
        name: extraModules:
        lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./modules/base
            ./systems/${name}
          ]
          ++ extraModules;
        };

      mkDesktopHost = name: mkHost name [ ./modules/desktop ];
    in
    {
      nixosConfigurations = {
        miku = mkDesktopHost "miku";
        teto = mkDesktopHost "teto";
        seber = mkHost "seber" [ ];
      };

      formatter.${system} = nixpkgs.legacyPackages.${system}.callPackage ./formatter.nix { };
    };
}
