set fish_greeting # Disable greeting
set GHQ_SELECTOR peco

# -g = global. fish 3.6 から global がデフォルトになったらしく、必要ないかも
abbr -a -g gc git commit -m
abbr -a -g gs git status -s
abbr -a -g gr git reset

abbr -a nba --set-cursor={} "nb add -f \"$(date -Iminutes).{}.md\""

set -x NB_DIR $HOME/ghq/github.com/harumaxy/nb

alias code=cursor
set -g theme_nerd_fonts yes
