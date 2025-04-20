{ pkgs, config, ... }@configContext: {
  # configurationRevision = self.rev or self.dirtyRev or null;
  stateVersion = 6;
  defaults.".GlobalPreferences"."com.apple.mouse.scaling" = 3.0;
  defaults.".GlobalPreferences"."com.apple.sound.beep.sound" =
    /System/Library/Sounds/Sosumi.aiff;

  keyboard.enableKeyMapping = true;
  keyboard.remapCapsLockToControl = true;

  defaults.finder = {
    AppleShowAllExtensions = true;
    _FXSortFoldersFirst = true;
    FXEnableExtensionChangeWarning = false;
    FXRemoveOldTrashItems = true;
    NewWindowTarget = "Home";
    FXPreferredViewStyle = "clmv";
    ShowPathbar = true;
    ShowStatusBar = true;
    AppleShowAllFiles = true;
  };

  defaults.ActivityMonitor.ShowCategory = 102;

  defaults.dock = {
    appswitcher-all-displays = true;
    autohide = true;
    expose-animation-duration = 1.0;
    magnification = true;
    mineffect = "suck";
    tilesize = 64 * 3;
    showhidden = true;
    wvous-tr-corner = 11;
  };

  defaults.NSGlobalDomain = {
    "com.apple.mouse.tapBehavior" = null;
    "com.apple.trackpad.scaling" = 3.0;
    AppleShowAllFiles = true;
    KeyRepeat = 2;
    NSAutomaticCapitalizationEnabled = false;
    NSAutomaticPeriodSubstitutionEnabled = false;
    NSAutomaticQuoteSubstitutionEnabled = false;
    NSAutomaticSpellingCorrectionEnabled = false;
    NSWindowShouldDragOnGesture = true;
    PMPrintingExpandedStateForPrint = true;
    PMPrintingExpandedStateForPrint2 = true;
  };

  defaults.loginwindow = {
    DisableConsoleAccess = false;
    LoginwindowText = "Customized by nix-darwin";
  };

  defaults.trackpad = {
    Clicking = true;
    TrackpadThreeFingerDrag = true;
  };

  activationScripts.applications.text = let
    env = pkgs.buildEnv {
      name = "system-applications";
      paths = config.environment.systemPackages;
      pathsToLink = "/Applications";
    };
  in pkgs.lib.mkForce ''
    # Set up applications.
    echo "setting up /Applications..." >&2
    rm -rf /Applications/Nix\ Apps
    mkdir -p /Applications/Nix\ Apps
    find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
    while read -r src; do
      app_name=$(basename "$src")
      echo "copying $src" >&2
      ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
    done
  '';
}
