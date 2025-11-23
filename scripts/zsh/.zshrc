# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"
plugins=(git)

if [ -d "$ZSH" ]; then
  source "$ZSH/oh-my-zsh.sh"
fi

# よく使うディレクトリ
export WORK_DIR="$HOME/work"
export DATASETS_DIR="$HOME/datasets"
export DATA_DIR="$HOME/data"
export MODELS_DIR="$HOME/models"

# PATH
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# fzf
if [ -f "$HOME/.fzf.zsh" ]; then
  source "$HOME/.fzf.zsh"
fi

# zoxide
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

# ちょっとした alias
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# ローカル専用設定（秘密系）はここ（git 管理しない）
[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"

