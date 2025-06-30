configContext: {
  enable = true;
  global.autoUpdate = true;
  onActivation.cleanup = "uninstall";
  brews = [
    "awscli"
    "sqldef/sqldef/psqldef"
  ];
  casks = [
    "arc"
    "google-chrome"
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
    "tailscale"
    "pgadmin4"
    "imageoptim"
    "gitify"
    "android-file-transfer"
    "firefox"
  ];
  # masApps = [ ];
  taps = [
    "sqldef/sqldef"
    "dzirtusss/tap"
  ];
  # whalebrew = [ ];
}
