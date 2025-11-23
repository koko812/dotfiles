#!/usr/bin/env bash
set -e

DOTFILES_DIR="${DOTFILES_DIR:-$HOME/dotfiles}"

echo "[bootstrap] using DOTFILES_DIR=$DOTFILES_DIR"

bash "$DOTFILES_DIR/scripts/install_shell_tools.sh"
bash "$DOTFILES_DIR/scripts/install_vim_tmux.sh"
bash "$DOTFILES_DIR/scripts/install_custom_bins.sh"

touch "$HOME/.dotfiles_bootstrapped"

echo
echo "[bootstrap] done."
echo "  - zsh/oh-my-zsh/fzf/zoxide"
echo "  - vim + plugins"
echo "  - tmux config"
echo "  - custom commands (e.g., gacp)"
echo
echo "Next steps:"
echo "  1) exec zsh"
echo "  2) (optional) vim +\"PlugInstall\" +qall"

