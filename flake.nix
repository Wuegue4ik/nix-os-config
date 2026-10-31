{ 
  description = "krugets";
  inputs = { 
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim/nixos-26.05";
    };
  };
  outputs = { nixpkgs, home-manager, nixvim, ... }: let system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;

      config = {
        allowUnfree = true;
      };

      overlays = [
        (final: prev: {

        })
      ];
    };
  in
  {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;

      modules = [
        ./nixos/configuration.nix

        {
          nixpkgs.pkgs = pkgs;
        }

        home-manager.nixosModules.home-manager

        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;

            sharedModules = [
              nixvim.homeModules.nixvim
            ];

            users.wuegue4ik = import ./home/home.nix;
          };
        }
      ];
    };
  };
  }
