set fish_greeting # Disable greeting
set GHQ_SELECTOR peco

# -g = global. fish 3.6 から global がデフォルトになったらしく、必要ないかも
abbr -a -g gc git commit -m
abbr -a -g gs git status -s
abbr -a -g gr git reset




set -x NB_DIR $HOME/ghq/github.com/harumaxy/nb
# nb の新しいファイル名に日付-時分を入れる (nbのファイル名に + や : の特殊文字が入ると検索できないのでうまいこと避ける)
function nba
  nb add -f $(date '+%Y-%m-%dT%H-%M').$argv[1].md -t $argv[1]
end

abbr -a nbr $EDITOR $NB_DIR
abbr -a dotfiles $EDITOR /etc/nix-darwin
set -g theme_nerd_fonts yes
set -g theme_newline_cursor "yes"

function qcd
    switch $argv[1]
        case work
            cd $HOME/work
        case movies
            cd ~/Movies
        case '*'
            echo "qcd: unknown key '$argv[1]'"
            return 1
    end
    pwd
end

complete -c qcd -a "work movies"

# 変な動作になるので無効化
# set -x CDPATH "$HOME:$HOME/Movies"

fish_add_path "$HOME/.bun/bin"
fish_add_path "$HOME/.local/bin"

zoxide init fish | source
git gtr init fish | source

function update-all
    cd /etc/nix-darwin && nix flake update && sudo darwin-rebuild switch
end

# claude code を --dangerously-skip-permissions で最大スループットを得る
abbr -a claude-yolo "claude --dangerously-skip-permissions"
abbr -a ccd "claude --dangerously-skip-permissions"
