{
  description = "Example nix-darwin system flake";

  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-25.11-darwin";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim-config = {
      url = "github:rschmi3/nixvim";
    };
  };

  outputs =
    {
      self,
      nix-darwin,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      system = "aarch64-darwin";
      nixvim-config = inputs.nixvim-config.packages.${system}.default;
      user = "ryan.schmidt@ecam.com";
    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#simple
      darwinConfigurations."Schmidts-MacBook-Pro" = nix-darwin.lib.darwinSystem {
        specialArgs = {
          inherit self;
          inherit nixvim-config;
          inherit user;
        };
        modules = [
          ./nixModules
          ./overlays

          home-manager.darwinModules.home-manager
          {
            imports = [ ./homeManagerModules/home.nix ];
          }
        ];
      };
    };
}
