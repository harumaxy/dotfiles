set fish_greeting # Disable greeting
set GHQ_SELECTOR peco

# -g = global. fish 3.6 から global がデフォルトになったらしく、必要ないかも
abbr -a -g gc git commit -m
abbr -a -g gs git status -s
abbr -a -g gr git reset


set -x NB_DIR $HOME/ghq/github.com/harumaxy/nb
# nb の新しいファイル名に日付-時分を入れる (nbのファイル名に + や : の特殊文字が入ると検索できないのでうまいこと避ける)
abbr -a nba --set-cursor={} "nb add -f \"$(date '+%Y-%m-%dT%H-%M').{}.md\""
abbr -a nbr code $NB_DIR

abbr -a dotfiles code /etc/nix-darwin

alias code=cursor
set -g theme_nerd_fonts yes
