#!/usr/bin/env bash

OS=$(uname)
MAC_APPS="/Applications:/Applications/Utilities:/System/Applications:/System/Applications/Utilities"

if [ $OS = "Darwin" ]
then

  echo -n "$MAC_APPS" | \
    xargs -d: -I{} -r find -L {} -name '*.app' -maxdepth 1 -mindepth 1 -printf '%P\n' 2>/dev/null | \
    sort -u | \
    fzf --multi --no-sort --reverse | \
    xargs -I{} open -n -a "{}"

fi
