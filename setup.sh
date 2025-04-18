# install nix with determinate (use nix from nixpkgs)

# with no determinate nix
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

ln -s $(pwd) /etc/nix-darwin
# nix run nix-darwin -- switch --flake .#${hostname}
nix run nix-darwin -- switch

# sudo echo /run/current-system/sw/bin/fish >> /etc/shells
# chsh -s /run/current-system/sw/bin/fish


