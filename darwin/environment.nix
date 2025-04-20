{ user, pkgs, config }: {
  variables = { };
  systemPackages = with pkgs; [ nerd-fonts.jetbrains-mono ];
  etc."sudoers.d/10-nix-commands".text = ''
    %admin ALL=(ALL:ALL) NOPASSWD: /run/current-system/sw/bin/darwin-rebuild, /run/current-system/sw/bin/nix*, /run/current-system/sw/bin/ln, /nix/store/*/activate, /bin/launchctl
  '';
}
