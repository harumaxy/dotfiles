set fish_greeting # Disable greeting
set GHQ_SELECTOR peco

abbr -a -g gc git commit -m
abbr -a -g gs git status -s
abbr -a -g gr git reset

abbr -a nba --set-cursor={} "nb add -f \"$(date -Iminutes).{}.md\""


alias code=cursor
set -g theme_nerd_fonts yes
