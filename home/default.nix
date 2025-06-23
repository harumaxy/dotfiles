{ pkgs, config, ... }:
{
  home = {
    stateVersion = "24.11";
    sessionVariables = {
      EDITOR = "code";
    };
    packages = with pkgs; [
      neovim
      git
      gh
      nixd
      ghq
      peco
      chezmoi
      nixfmt-rfc-style
      nixd
      ripgrep
      ripgrep-all
      bat
      # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
      nb
      w3m
      httpie
      postgresql
      wget
      ffmpeg
      imagemagick
    ];
    file = {
      # ".config/nvim".source = ./config/nvim;
    };
  };
  programs = {
    home-manager.enable = true;
    git = import ./programs/git.nix;
    gh.enable = true;
    fish = (import ./programs/fish/default.nix) pkgs;
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    mise = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
