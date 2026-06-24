configContext: {
  enable = true;
  global.autoUpdate = true;
  onActivation.cleanup = "uninstall";
  onActivation.upgrade = true;
  brews = [
    "awscli"
    "sqldef/sqldef/psqldef"
    "yt-dlp"
    "wakeonlan"
    "mpv"
    "ni"
    "wireshark"
    "pandoc"
    "aws-sam-cli"
    "mkcert"
    "miller"
    #  brew install autoconf automake bison freetype gd gettext icu4c krb5 libedit libiconv libjpeg libpng libxml2 libzip pkg-config re2c zlib
    "autoconf"
    "automake"
    "bison"
    "freetype"
    "gd"
    "gettext"
    "icu4c"
    "krb5"
    "libedit"
    "libiconv"
    "libjpeg"
    "libpng"
    "libxml2"
    "libzip"
    "pkg-config"
    "re2c"
    "zlib"
    # brew install gmp libsodium imagemagick
    "gmp"
    "libsodium"
    "imagemagick"
    "oniguruma"
    "libpq"
    "defaultbrowser"
    "git"
    "git-gtr"
    "mq"
  ];
  casks = [
    "arc"
    "google-chrome"
    "brave-browser"
    "appcleaner"
    # "cursor"
    "visual-studio-code"
    "deepl"
    "ghostty"
    "google-japanese-ime" # キーボード設定で適当なのを + / - して反映する
    "hammerspoon"
    "dzirtusss/tap/vifari" # hammerspoonに依存
    "karabiner-elements"
    "microsoft-teams"
    "orbstack"
    "raycast"
    "rectangle"
    "slack"
    "notion"
    "vlc"
    "betterdisplay"
    "font-fira-code-nerd-font"
    "pgadmin4"
    "imageoptim"
    "android-file-transfer"
    "firefox"
    "deskflow"
    "anki"
    "blender"
    "claude"
    "termius"
    "tailscale-app"
    "discord"
    "android-studio"
    "godot"
    "zed"
  ];
  # masApps = [ ];
  taps = [
    "sqldef/sqldef"
    "dzirtusss/tap"
    "deskflow/homebrew-tap"
    "coderabbitai/tap"
  ];
  # whalebrew = [ ];
}
