#!/usr/bin/env bash
set -e

DOTFILES_DIR="$HOME/dotfiles"
BIN_SRC="$DOTFILES_DIR/bin"
BIN_DEST="$HOME/.local/bin"

mkdir -p "$BIN_DEST"

for f in "$BIN_SRC"/*; do
    [ -f "$f" ] || continue   # ファイル以外はスキップ

    cmd=$(basename "$f")

    echo "[install] $cmd"

    # 実行権限を付与
    chmod +x "$f"

    # シンボリックリンクを貼る
    ln -sf "$f" "$BIN_DEST/$cmd"
done

echo "Custom commands installed to $BIN_DEST"

