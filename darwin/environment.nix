{ pkgs }@configContext: {
  variables = { };
  # shells = [ /run/current-system/sw/bin/fish ];
  
  # nix-darwin でインストールした fish に切り替え
  extraSetup = ''
    if ! grep -q "/run/current-system/sw/bin/fish" /etc/shells; then
      sudo echo "/run/current-system/sw/bin/fish" >> /etc/shells
      sudo chsh -s /run/current-system/sw/bin/fish
    fi
  '';
  etc."sudoers.d/10-nix-commands".text = ''
    %admin ALL=(ALL:ALL) NOPASSWD: /run/current-system/sw/bin/darwin-rebuild, /run/current-system/sw/bin/nix*, /run/current-system/sw/bin/ln, /nix/store/*/activate, /bin/launchctl
  '';
}
