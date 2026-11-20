# dotfiles

Homebrew + [chezmoi](https://www.chezmoi.io/) で管理する macOS 環境。

## セットアップ

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/harumaxy/dotfiles/main/setup.sh)"
```

## 構成

- `Brewfile` — brew / cask / tap。変更すると `chezmoi apply` 時に `brew bundle` が走る
- `run_onchange_after_30-macos-defaults.sh` — macOS の defaults。変更すると再実行される
- `dot_config/fish/` — fish 設定。プラグインは `fish_plugins` (fisher)
- `dot_config/git/` — git 設定
- `Library/LaunchAgents/` — CapsLock → Control (hidutil)
- `raycast/` — Raycast script (chezmoi 管理外。Raycast から直接参照)

## 使い方

```sh
chezmoi apply        # 反映
chezmoi diff         # 差分確認
update-all           # brew update/upgrade + chezmoi apply (fish)
brew bundle cleanup --file=Brewfile   # Brewfile に無いものを確認 (--force で削除)
```

fish の実験用設定は git 管理外の `~/.config/fish/config.local.fish` に書く。
