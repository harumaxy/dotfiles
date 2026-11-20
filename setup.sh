#!/bin/bash
# 新しいマシンのセットアップ (macOS / Apple Silicon)
set -eu

xcode-select -p >/dev/null 2>&1 || xcode-select --install

if ! command -v /opt/homebrew/bin/brew >/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
eval "$(/opt/homebrew/bin/brew shellenv)"
brew install chezmoi git

# ghq 配下に clone して、そこを chezmoi の source にする
SRC="$HOME/ghq/github.com/harumaxy/dotfiles"
[ -d "$SRC" ] || git clone https://github.com/harumaxy/dotfiles "$SRC"
mkdir -p ~/.config/chezmoi
echo "sourceDir = \"$SRC\"" > ~/.config/chezmoi/chezmoi.toml
chezmoi apply </dev/null  # stdin を閉じないと fisher スクリプトが止まることがある

# fish をログインシェルにする
FISH=/opt/homebrew/bin/fish
grep -qx "$FISH" /etc/shells || echo "$FISH" | sudo tee -a /etc/shells
[ "$SHELL" = "$FISH" ] || chsh -s "$FISH"
