# install nix with determinate (use nix from nixpkgs)

# with no determinate nix
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

ln -s $(pwd) /etc/nix-darwin
# nix run nix-darwin -- switch --flake .
nix run nix-darwin -- switch

# home-manager でインストールしたシェルをデフォルトにする。
sudo echo /Users/$(whoami)/.nix-profile/bin/fish >> /etc/shells
sudo chsh -s /Users/$(whoami)/.nix-profile/bin/fish