# Homebrew (Apple Silicon)
/opt/homebrew/bin/brew shellenv | source
set -gx HOMEBREW_NO_REQUIRE_TAP_TRUST 1

set -gx EDITOR "zed --wait"

abbr -a ww wakeonlan 04:7C:16:4A:EB:C4

# ユーザー任意の設定 (git 管理外)
set -l local_config $HOME/.config/fish/config.local.fish
if test -f $local_config
    source $local_config
end

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
abbr -a dotfiles $EDITOR ~/ghq/github.com/harumaxy/dotfiles
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


# claude code を --dangerously-skip-permissions で最大スループットを得る
abbr -a claude-yolo "claude --dangerously-skip-permissions"
abbr -a ccd "claude --dangerously-skip-permissions"

# 全ディスプレイ (内蔵含む) の輝度を一括設定 (例: bright 50)
function bright -d "全ディスプレイ輝度一括設定"
    set -l v (math $argv[1] / 100)
    for uuid in (betterdisplaycli get -identifiers -displays | string match -r '"UUID" : "(.+)"' -g)
        betterdisplaycli set -UUID=$uuid -brightness=$v &
    end
    wait
end

function nbnew
    nb add -f "$(date -Iminutes).$argv[1].md"
end

# マージ済み(リモートで削除された)ローカルブランチを掃除する。
# squash マージ運用向け: --merged は効かないので gone 判定で消す。
function git-clean-merged
    git fetch --prune
    git branch -vv | grep ': gone]' | awk '{print $1}' | xargs -L1 git branch -D
end

mise activate fish | source
direnv hook fish | source

function update-all
    brew update; and brew upgrade; and chezmoi apply
end

# bobthefish の右プロンプトを無効化
function fish_right_prompt; end
