#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Grayscale Color-filter
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🕶️
# @raycast.packageName System

# Documentation:
# @raycast.description システム設定 > アクセシビリティ > カラーフィルタの画面を開く

-- カラーフィルタのペインを直接開く
do shell script "open 'x-apple.systempreferences:com.apple.preference.universalaccess?Seeing_ColorFilters'"
