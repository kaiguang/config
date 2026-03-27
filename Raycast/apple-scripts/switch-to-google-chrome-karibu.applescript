#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title switch to google chrome karibu profile
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.author Kai Li
# @raycast.authorURL https://twitter.com/KaiguangLi

set windowName to "karibu" -- The display name shown in Chrome's title bar

tell application "Google Chrome"
    repeat with w in windows
        if name of w contains windowName then
            set index of w to 1
            activate
            exit repeat
        end if
    end repeat
end tell
