#!/usr/bin/env bash

VAULT_PATH="$HOME/.local/share/obsidian"

cd $VAULT_PATH

DIFF=$(git diff | wc -l)

function sync {
  echo "Syncing Obsidian vault..."
  git add *
  git commit -m "Obsidian sync $(date)"
  git push origin master
}

if [ "$DIFF" -gt 0 ]; then
  sync
else
  echo "No changes to Obsidian vault."
fi
