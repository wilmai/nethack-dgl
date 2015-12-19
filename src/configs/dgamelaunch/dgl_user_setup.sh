#!/bin/bash
n="$1"

# Setup nethack data
nh360=/root/data/nh360
# rcfile
[ -f "$nh360/rcfiles/$n.nh360rc" ] || cp "$nh360/nethack-default-rcfile" "$nh360/rcfiles/$n.nh360rc"
mkdir -p "$nh360/ttyrec/$n"
