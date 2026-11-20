# dotfiles

Homebrew + [chezmoi](https://www.chezmoi.io/) で管理する macOS 環境。

## セットアップ

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/harumaxy/dotfiles/main/setup.sh)"
```

## 構成

```
.chezmoiroot      # chezmoi のソースを chezmoi/ に限定する
Brewfile          # brew / cask / tap
setup.sh          # 新マシンの導入
raycast/          # Raycast script (Raycast から直接参照)
chezmoi/          # ← chezmoi が管理する部分
├── dot_config/   # ~/.config (fish, git)。dot_ は先頭の . の代わり
├── Library/      # LaunchAgents (CapsLock → Control)
└── .chezmoiscripts/   # apply 時に実行するスクリプト (ホームには展開されない)
    ├── run_onchange_before_10-brew-bundle.sh.tmpl   # Brewfile が変わったら brew bundle
    ├── run_onchange_after_20-fisher.fish.tmpl       # fish_plugins が変わったら fisher update
    └── run_onchange_after_30-macos-defaults.sh      # macOS の defaults (内容が変わったら再実行)
```

## 使い方

```sh
chezmoi apply        # 反映
chezmoi diff         # 差分確認
update-all           # brew update/upgrade + chezmoi apply (fish)
brew bundle cleanup --file=Brewfile   # Brewfile に無いものを確認 (--force で削除)
```

fish の試用設定は git 管理外の `~/.config/fish/config.local.fish` に書く (config.fish の最後に読むので上書きできる)。良ければ `chezmoi re-add` / `chezmoi add` で取り込む。
