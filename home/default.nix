{ pkgs, config, ... }: {
  home = {
    stateVersion = "24.11";
    sessionVariables = { EDITOR = "code"; };
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
      # pkgs.vscode
      # ghostty
      # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
      # 簡単なシェルスクリプトを ~/.nix-profile/bin に出力。パス通ってるので実行できる。
      (pkgs.writeShellScriptBin "my-hello" ''
        echo "Hello, ${config.home.username}!"
      '')
    ];
    file = { ".config/nvim".source = ./config/nvim; };
  };
  programs = {
    home-manager.enable = true;
    git = import ./programs/git.nix;
    gh.enable = true;
    fish = (import ./programs/fish/default.nix) pkgs;
    direnv = import ./programs/direnv.nix;
  };
}
