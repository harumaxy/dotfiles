{ pkgs, config, ... }:
{
  nixpkgs.config.allowUnfree = true;
  home = {
    stateVersion = "24.11";
    sessionVariables = {
      EDITOR = "zed";
    };
    packages = with pkgs; [
      neovim
      git
      gh
      nixd
      ghq
      peco
      chezmoi
      nixfmt
      nixd
      ripgrep
      ripgrep-all
      bat
      # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
      nb
      httpie
      postgresql
      wget
      ffmpeg
      imagemagick
      fpp
      zoxide
      cloudflared
      ngrok
      tmux
      fd
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
