#!/usr/bin/env bash

# Terminate all running polybar instances
killall -q polybar

# Wait until all instances has been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Start polybar
polybar -q main
