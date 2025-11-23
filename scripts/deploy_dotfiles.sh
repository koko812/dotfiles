#!/usr/bin/env bash
set -e

echo "=== Dotfiles Deployment ==="

DOTFILES_DIR="$HOME/dotfiles"
BACKUP_DIR="$HOME/.dotfiles_backup/$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

link() {
    local src=$1
    local dest=$2

    # 既存の dest が通常ファイル／ディレクトリ／シンボリックリンクのいずれでもバックアップ
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        echo "[backup] $dest → $BACKUP_DIR/"
        mv "$dest" "$BACKUP_DIR/"
    fi

    # シンボリックリンク作成
    echo "[link] $dest → $src"
    ln -s "$src" "$dest"
}

link "$DOTFILES_DIR/zsh/.zshrc"      "$HOME/.zshrc"
link "$DOTFILES_DIR/vim/.vimrc"      "$HOME/.vimrc"
link "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"

echo "Done! Backup stored at: $BACKUP_DIR"

