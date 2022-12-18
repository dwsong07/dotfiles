#!/bin/bash

sleep_pid=0

echo ".."

_checkupdates() {
    repo=$(checkupdates 2> /dev/null | wc -l )
    aur=$(yay -Qua 2> /dev/null | wc -l)

    updates=$((repo + aur))
    echo $updates
}

_update() {
    notify-send -a "Update checker"  "Checking updates.."
    echo ".."
    if [ "$sleep_pid" -ne 0 ]; then
        kill $sleep_pid >/dev/null 2>&1
    fi
}

trap "_update" USR1

while true; do
    _checkupdates
    sleep 900 &
    sleep_pid=$!
    wait
done

