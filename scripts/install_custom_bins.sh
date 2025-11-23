#!/usr/bin/env bash
set -e

DOTFILES_DIR="${DOTFILES_DIR:-$HOME/dotfiles}"
TARGET_BIN="$HOME/bin"

mkdir -p "$TARGET_BIN"

echo "[info] Linking custom commands from $DOTFILES_DIR/bin to $TARGET_BIN"

for f in "$DOTFILES_DIR/bin/"*; do
  cmd=$(basename "$f")
  ln -sf "$f" "$TARGET_BIN/$cmd"
  echo "[ok] $cmd → $TARGET_BIN/$cmd"
done

