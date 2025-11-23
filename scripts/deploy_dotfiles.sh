#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="${HOME}/dotfiles"
BACKUP_DIR="${HOME}/dotfiles_backup"

timestamp=$(date +"%Y%m%d_%H%M%S")

backup_file() {
    local target="$1"
    if [ -f "$target" ] || [ -d "$target" ]; then
        mkdir -p "$BACKUP_DIR"
        mv "$target" "${BACKUP_DIR}/$(basename "$target").${timestamp}"
        echo "[backup] $(basename "$target") → $BACKUP_DIR"
    fi
}

deploy_file() {
    local src="$1"
    local dest="$2"

    backup_file "$dest"
    ln -s "$src" "$dest"
    echo "[link] $dest → $src"
}

echo "=== Dotfiles Deployment ==="

# zsh
deploy_file "${DOTFILES_DIR}/zsh/.zshrc" "${HOME}/.zshrc"

# tmux
deploy_file "${DOTFILES_DIR}/tmux/.tmux.conf" "${HOME}/.tmux.conf"

# vim
deploy_file "${DOTFILES_DIR}/vim/.vimrc" "${HOME}/.vimrc"

echo "Done! (backup in $BACKUP_DIR)"

