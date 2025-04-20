{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "flake:nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "flake:nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "flake:home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
  };

  outputs =
    { self, nixpkgs, nix-darwin, home-manager, nix-homebrew, ... }@inputs:
    let
      user = "masaharuhosomichi";
      hostname = "MacBook-Pro";
      flakeContext = { inherit inputs user hostname; };
    in {
      darwinConfigurations."${hostname}" = import ./darwin flakeContext;
      # homeConfigurations.${user} = { ${user} = import ./home flakeContext; };
    };
}
