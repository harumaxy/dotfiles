{ inputs, user, hostname, ... }@flakeContext:
let
  configuration = { config, pkgs, ... }@configContext: {
    environment.systemPackages = with pkgs; [ nerd-fonts.jetbrains-mono fish ];
    homebrew = import ./homebrew.nix configContext;
    system = import ./system.nix configContext;

    nix.settings.experimental-features = "nix-command flakes";
    programs.fish.enable = true;
    nixpkgs.hostPlatform = "aarch64-darwin";

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
