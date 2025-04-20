{ inputs, user, hostname, ... }@flakeContext:
let
  configuration = { config, pkgs, ... }@configContext: {
    nixpkgs.hostPlatform = "aarch64-darwin";
    nix.settings.experimental-features = "nix-command flakes";

    environment = import ./environment.nix { inherit user pkgs config; };
    homebrew = import ./homebrew.nix configContext;
    system = import ./system.nix configContext;
    programs = { fish.enable = true; };

  };
  home-manager = inputs.home-manager;
in inputs.nix-darwin.lib.darwinSystem {
  system = "aarch64-darwin";
  specialArgs = { inherit inputs; };
  modules = [
    configuration
    # homebrew
    inputs.nix-homebrew.darwinModules.nix-homebrew
    {
      nix-homebrew = {
        enable = true;
        user = user;
        enableRosetta = true;
        # taps = {};
        mutableTaps = true;
      };
    }
    # home-manager
    home-manager.darwinModules.home-manager
    {
      users.users.${user}.home = "/Users/${user}";
      home-manager = {
        # useGlobalPkgs = true;
        # useUserPackages = true;
        users."${user}" = import ../home;
      };
    }
  ];
}
