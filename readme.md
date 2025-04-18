## setup

- Nix を [Determinate installer](https://zero-to-nix.com/start/install/) でインストール
  - この時、 Determinate ディストリビューション Nix をインストールすと、 Determinate が Nix のインストール自体を管理するようになる。
  - nix-darwin に推奨されるバニラ Nix (from nixos.org) をインストールすため、ウィザードで聞かれる選択肢は no
```sh
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | \
  sh -s -- install
```

- nix-darwin を flake スタイルでインストール
- darwin-rebuild をインストール
  - `/etc/(bashrc|zshrc)` が作成され、 `darwin-rebuild` コマンドにPATHが通る
  - fish を使う場合、 `/etc/nix-darwin/flake.nix` の config で `programs.fish.enable = true;` をコメントアウトする

## nix-darwin 使い方

```sh
darwin-rebuild switch # 依存関係の反映
darwin-help # nix-darwin のドキュメントを web で開く
```


## home-manager

`home.nix` に全ての設定をまとめる。
このファイルを新しいマシンにコピーして `home-manager switch` で必要なツールすべてインストールできる

```sh
nix run home-manager/master -- init --switch # これを実行すると、 home-manager 実行ファイルのシンボリックリンクが ~/.nix-profile/bin に配置されて使えるようになる。シェル再起動必要

# 完了すると設定ファイルが以下に追加される
code ~/.config/home-manager/home.nix

# 編集して必要なpkgをインストールしたら、
```

なんで `nix run` だけで home-manager がグローバルで使えるようになるのか？
生成された `home.nix` で `preograms.home-manager.enable = true;` 記述を解釈して `home.packages` 宣言に展開される
つまり HM は HM 自身を管理してインストールする。


### home.file

```nix
home.file."~からの相対パス".source = <home.nixからの相対パス>
```

指定のファイルを symbolic link にして、右辺のディレクトリ/ファイルに置き換える
dotfiles パターンで、設定ファイルなどを置き換えるのに便利 

注意点
- `home.nix` からの相対パスであることに注意
- リンク先にすでにファイルがある場合、 `*.backup` を付けて元のファイル/ディレクトリを残せる
- git add してトラックされていないファイルがあるとエラー
- 実体は Nix store に保存されるので、 Dotfiles の中身の設定を変更したら再度 `home-manager switch` が必要
- シンボリックリンクを開くと readonly モードになる。直接編集するには dotfiles をいじって switch


## home.programs

https://github.com/nix-community/home-manager/tree/master/modules/programs

home-manager リポジトリに載っているプログラムの設定ファイルを、 Nix 言語で書ける。
`home.nix` に一元管理できる、Nix 式をファイル分割して import も出来る。
設定できるプログラム&オプションは、リポジトリの該当の nix ファイルにある。

デフォルトの場所とちょっと変わったところに置かれるかもしれないので注意
(git なら、 `.config/git/` に config と ignores リンクが置かれる。ファイル実体は nix store にある)

home-manager repo を clone して、AIに聞きながら設定するのがよし。
`mkOption` という Nix 関数で設定可能なオプションが定義される。

