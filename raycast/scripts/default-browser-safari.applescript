#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Default Browser: Safari
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🧭
# @raycast.packageName Browser

# defaultbrowser CLI を実行して変更しつつ、出てくるダイアログのOKボタンを自動でポーリング&クリック

do shell script "defaultbrowser safari 2>/dev/null"

try
  repeat 15 times
    tell application "System Events"
      if exists window 1 of process "CoreServicesUIAgent" then
        tell process "CoreServicesUIAgent"
          click button 1 of window 1
        end tell
        exit repeat
      end if
    end tell
    delay 0.3
  end repeat
end try
