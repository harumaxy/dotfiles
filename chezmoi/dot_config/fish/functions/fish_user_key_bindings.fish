function fish_user_key_bindings
    # jj => normal mode
    bind -M insert jj "if commandline -P; commandline -f cancel; else; set fish_bind_mode default; commandline -f backward-char force-repaint; end"
    # Ctrl + ] => peco + ghq
    bind \c] '__ghq_repository_search'
    if bind -M insert >/dev/null 2>/dev/null
        bind -M insert \c] '__ghq_repository_search'
    end
end
