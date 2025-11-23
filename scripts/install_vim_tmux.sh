#!/usr/bin/env bash
set -e

DOTFILES_DIR="${DOTFILES_DIR:-$HOME/dotfiles}"

# ---- vimrc ----
mkdir -p "$HOME/.vim"

# vim-plug を入れておく（plug#begin を使うので）
if [ ! -f "$HOME/.vim/autoload/plug.vim" ]; then
  echo "[info] Installing vim-plug..."
  curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
  echo "[info] vim-plug already installed. skip."
fi

if [ -f "$HOME/.vimrc" ] && [ ! -L "$HOME/.vimrc" ]; then
  echo "[warn] ~/.vimrc exists, backing up..."
  mv "$HOME/.vimrc" "$HOME/.vimrc.bak.$(date +%Y%m%d%H%M%S)"
fi

ln -sf "$DOTFILES_DIR/vim/.vimrc" "$HOME/.vimrc"
echo "[ok] ~/.vimrc -> $DOTFILES_DIR/vim/.vimrc"

# ---- tmux.conf （あれば）----
if [ -f "$DOTFILES_DIR/tmux/.tmux.conf" ]; then
  if [ -f "$HOME/.tmux.conf" ] && [ ! -L "$HOME/.tmux.conf" ]; then
    echo "[warn] ~/.tmux.conf exists, backing up..."
    mv "$HOME/.tmux.conf" "$HOME/.tmux.conf.bak.$(date +%Y%m%d%H%M%S)"
  fi
  ln -sf "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"
  echo "[ok] ~/.tmux.conf -> $DOTFILES_DIR/tmux/.tmux.conf"
else
  echo "[info] tmux config not found in dotfiles (skip)."
fi

echo "[done] vim/tmux configs linked. Run 'vim' then ':PlugInstall' once."

