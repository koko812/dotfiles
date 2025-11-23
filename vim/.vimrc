nnoremap <C-t> :NERDTreeToggle<CR>
inoremap <silent> jj <ESC>
inoremap <expr> /
      \ complete_info(['mode']).mode == 'files' && complete_info(['selected']).selected >= 0
      \   ? '<c-x><c-f>'
      \   : '/'

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'davidhalter/jedi-vim', {'for': 'python'}   " pythonファイルを編集するときだけ起動
Plug 'preservim/nerdtree'
Plug 'Townk/vim-autoclose'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
call plug#end()

" 共通のインデント設定（すべてのファイルタイプに適用）
set tabstop=2       " タブ文字の表示幅を2に
set shiftwidth=2    " 自動インデントの幅を2に
set softtabstop=2   " タブキーの入力幅を2に
set expandtab       " タブをスペースに変換
