{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "masaharuhosomichi";
  home.homeDirectory = "/Users/masaharuhosomichi";
  home.stateVersion = "24.11"; # Don't change
  home.packages = [
    pkgs.hello
    pkgs.git
    pkgs.nixfmt-rfc-style
    pkgs.nil
    pkgs.nixd

    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
    # 簡単なシェルスクリプトを ~/.nix-profile/bin に出力。パス通ってるので実行できる。
    (pkgs.writeShellScriptBin "my-hello" ''
      echo "Hello, ${config.home.username}!"
    '')
    (pkgs.writeShellScriptBin "hm" ''
      home-manager switch
    '')

  ];
  home.file = {
    ".config/nvim".source = ./config/nvim;
    # ".gitconfig".source = ./.gitconfig;
    # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  programs = {
    git = {
      enable = true;
      userEmail = "harumaxy@gmail.com";
      userName = "harumaxy";
      lfs.enable = true;
      iniContent = {
        core.editor = "code --wait";
        push.autoSetupRemote = true;
        init.defaultBranch = "main";
      };
      ignores = [
        ".DS_Store"
        "node_modules"
      ];
    };
    gh = {
      enable = true;
    };
    # fish = {
    #   enable = true;
    #   package = pkgs.fish;
    # };

  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/masaharuhosomichi/etc/profile.d/hm-session-vars.sh
  #
  # home.sessionVariables = {
  #   EDITOR = "nvim";
  # };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
