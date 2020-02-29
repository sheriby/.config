set number 
set relativenumber
set tabstop=4
set smartindent
set shiftwidth=4
set expandtab
set softtabstop=4
set nobackup
set noswapfile
set noerrorbells
autocmd BufWritePost $MYVIMRC source $MYVIMRC

call plug#begin()
Plug 'https://github.com/vim-scripts/fcitx.vim.git'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/vim-easy-align'
Plug 'jiangmiao/auto-pairs'
Plug 'ncm2/ncm2'
" Need pip3 install pynvim --user
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
" Need pip3 install jedi --user
Plug 'ncm2/ncm2-jedi'
Plug 'junegunn/fzf', { 'do': './install --bin'  }
Plug 'junegunn/fzf.vim'
Plug 'connorholyday/vim-snazzy'
Plug 'dracula/vim', {'name': 'dracula'}
"Plug 'ncm2/ncm2-pyclang'
call plug#end()

autocmd BufEnter * call ncm2#enable_for_buffer()

set completeopt=noinsert,menuone,noselect
let ncm2#popup_delay = 5
let g:ncm2#matcher = 'substrfuzzy'


" plug snazzy
color snazzy
let g:SnazzyTransparent = 1
" color dracula
syntax enable
 set background=dark

set shortmess+=c
inoremap <c-c> <ESC>
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
au User Ncm2Plugin call ncm2#register_source({
        \ 'name' : 'css',
        \ 'priority': 9,
        \ 'subscope_enable': 1,
        \ 'scope': ['css','scss'],
        \ 'mark': 'css',
        \ 'word_pattern': '[\w\-]+',
        \ 'complete_pattern': ':\s*',
        \ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
        \ 
        \})
