export LANG=${LANG:-en_US.UTF-8}
export LC_CTYPE=${LC_CTYPE:-en_US.UTF-8}

# ---------- oh-my-zsh ----------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"
plugins=(git)

if [ -d "$ZSH" ]; then
  source "$ZSH/oh-my-zsh.sh"
fi

# ---------- common directories ----------
export WORK_DIR="$HOME/work"
export DATASETS_DIR="$HOME/datasets"
export DATA_DIR="$HOME/data"
export MODELS_DIR="$HOME/models"

# ---------- PATH ----------
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# ---------- fzf ----------
if [ -f "$HOME/.fzf.zsh" ]; then
  source "$HOME/.fzf.zsh"
fi

# ---------- zoxide ----------
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

# ---------- aliases ----------
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# ---------- local-only settings ----------
[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"

