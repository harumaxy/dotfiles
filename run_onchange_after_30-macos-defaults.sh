#!/bin/bash
# macOS の設定 (旧 darwin/system.nix)。内容を変更すると次回 chezmoi apply で再実行される。
set -eu

# CapsLock -> Control (即時反映。永続化は LaunchAgent 側)
hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":30064771129,"HIDKeyboardModifierMappingDst":30064771296}]}' >/dev/null

# Global
defaults write -g com.apple.mouse.scaling -float 3.0
defaults write -g com.apple.trackpad.scaling -float 3.0
defaults write -g com.apple.sound.beep.sound -string /System/Library/Sounds/Sosumi.aiff
defaults delete -g com.apple.mouse.tapBehavior 2>/dev/null || true
defaults write -g AppleShowAllFiles -bool true
defaults write -g KeyRepeat -int 2
defaults write -g NSAutomaticCapitalizationEnabled -bool false
defaults write -g NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false
defaults write -g NSWindowShouldDragOnGesture -bool true
defaults write -g PMPrintingExpandedStateForPrint -bool true
defaults write -g PMPrintingExpandedStateForPrint2 -bool true

# Finder
defaults write com.apple.finder AppleShowAllExtensions -bool true
defaults write com.apple.finder _FXSortFoldersFirst -bool true
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder FXRemoveOldTrashItems -bool true
defaults write com.apple.finder NewWindowTarget -string PfHm
defaults write com.apple.finder NewWindowTargetPath -string "file://$HOME/"
defaults write com.apple.finder FXPreferredViewStyle -string clmv
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder AppleShowAllFiles -bool true

# Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 102

# Dock
defaults write com.apple.dock appswitcher-all-displays -bool true
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock expose-animation-duration -float 1.0
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock mineffect -string suck
defaults write com.apple.dock tilesize -int 192
defaults write com.apple.dock showhidden -bool true
defaults write com.apple.dock wvous-tr-corner -int 11
defaults write com.apple.dock wvous-tr-modifier -int 0

# Trackpad
for d in com.apple.AppleMultitouchTrackpad com.apple.driver.AppleBluetoothMultitouch.trackpad; do
  defaults write $d Clicking -bool true
  defaults write $d TrackpadThreeFingerDrag -bool true
done

killall Dock Finder 2>/dev/null || true
