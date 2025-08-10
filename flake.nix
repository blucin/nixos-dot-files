{
  description = "Blucin's NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: 
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations = {
      sandcastle = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/sandcastle/default.nix
        ];
      };
      camelot = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/camelot/default.nix
        ];
      };
    };

    homeConfigurations."blucin@camelot" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = { inherit inputs; };
      modules = [
        ./home/home.nix
      ];
    };
  };
}

