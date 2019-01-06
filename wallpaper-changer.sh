#!/bin/bash

# This assumes you have 3 monitors (including Macbook laptop)
monitor=`seq 1 3 | /usr/local/bin/gshuf -n 1`

ls ${HOME}/Pictures/Wallpapers/* > /tmp/wallpapers
cat -n /tmp/wallpapers | grep -v "^    `echo $(((\`date +%m\`)*1))`" | grep -v "^    `echo $(((\`date +%m\`)*2))`" | grep -v "^    `echo $(((\`date +%m\`)*3))`" | grep -v "^    `echo $(((\`date +%m\`)*4))`" | grep -v "^    `echo $(((\`date +%m\`)*5))`" | sed -e 's/ [0-9]*//g' | awk '{$1=$1};1' > /tmp/wallpapers.tmp

wallpaper=`cat /tmp/wallpapers.tmp | /usr/local/bin/gshuf -n 1`

/usr/bin/osascript -e "tell application \"System Events\"
  tell desktop ${monitor}
    set picture to \"${wallpaper}\"
    end tell
  end tell"
