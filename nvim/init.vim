"  __  __        __     _____ __  __ ____   ____
" |  \/  |_   _  \ \   / /_ _|  \/  |  _ \ / ___|
" | |\/| | | | |  \ \ / / | || |\/| | |_) | |
" | |  | | |_| |   \ V /  | || |  | |  _ <| |___
" |_|  |_|\__, |    \_/  |___|_|  |_|_| \_\\____|
"         |___/
"
"                       _____ __  __     ____  _ ____       
"                      / ___// / / /__  / __ \(_) __ )__  __
"                      \__ \/ /_/ / _ \/ /_/ / / __  / / / /
"                     ___/ / __  /  __/ _, _/ / /_/ / /_/ / 
"                    /____/_/ /_/\___/_/ |_/_/_____/\__, /  
"                                                  /____/   
"
"============================================================

call plug#begin()
Plug 'https://github.com/vim-scripts/fcitx.vim.git'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/vim-easy-align'
Plug 'jiangmiao/auto-pairs'
" Plug 'ncm2/ncm2'
" Need pip3 install pynvim --user
" Plug 'roxma/nvim-yarp'
" Plug 'ncm2/ncm2-bufword'
" Plug 'ncm2/ncm2-path'
" Need pip3 install jedi --user
" Plug 'ncm2/ncm2-jedi'
Plug 'junegunn/fzf', { 'do': './install --bin'  }
Plug 'junegunn/fzf.vim'
Plug 'connorholyday/vim-snazzy'
Plug 'dracula/vim', {'name': 'dracula'}
"Plug 'ncm2/ncm2-pyclang'

Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'mhinz/vim-startify'
Plug 'Chiel92/vim-autoformat'
Plug 'Yggdroot/indentLine'
"Plug 'jacoborus/tender.vim'
Plug 'vim-python/python-syntax'
Plug 'preservim/nerdcommenter'
Plug 'luochen1990/rainbow'
Plug 'gruehle/MarkdownPreview'
Plug 'junegunn/vim-easy-align'
Plug 'dhruvasagar/vim-table-mode'
Plug 'lambdalisue/gina.vim'
call plug#end()

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
set encoding=UTF-8
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a
set list
set scrolloff=10
let g:mapleader='.'
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" quick move
"nmap <C-j> 5j
"nmap <C-k> 5k
imap <C-j> <Esc>
nmap <C-j> 5j
nmap <C-k> 5k

" split
map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sj :set splitbelow<CR>:split<CR>
map sk :set nosplitbelow<CR>:split<CR>

" move my window
map md <C-w>l
map ma <C-w>h
map ms <C-w>j
map mw <C-w>k

map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K

" resize my window
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize -5<CR>
map <right> :vertical resize +5<CR>

map tu :tabe<CR>
map th :-tabnext<CR>
map tl :+tabnext<CR>

" fzf 
map <C-h> :History<CR>


" placeholder 
nmap <SPACE><SPACE> /<++><CR>:nohlsearch<CR>4xi

" compile this file
nmap <C-r> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!gcc % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        silent! exec "!clear"
        exec "!time python3 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'markdown'
        exec "!MarkdownPreview"
    elseif &filetype == "vimwiki"
        exec "!MarkdownPreview"
    endif
endfunc


" MarkDown Snippets
autocmd FileType markdown inoremap ,f <Esc>/<++><CR>:nohlsearch<CR>4xi
autocmd FileType markdown inoremap ,n <Enter><Enter>
autocmd FileType markdown inoremap ,b **** <++><Esc>F*hi
autocmd FileType markdown inoremap ,s ~~~~ <++><Esc>F~hi
autocmd FileType markdown inoremap ,i ** <++><Esc>F*i
autocmd FileType markdown inoremap ,d `` <++><Esc>F`i
autocmd FileType markdown inoremap ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd FileType markdown inoremap ,p ![](<++>) <++><Esc>F[a
autocmd FileType markdown inoremap ,a [](<++>) <++><Esc>F[a
autocmd FileType markdown inoremap ,1 #<Space><Enter><++><Esc>kA
autocmd FileType markdown inoremap ,2 ##<Space><Enter><++><Esc>kA
autocmd FileType markdown inoremap ,3 ###<Space><Enter><++><Esc>kA
autocmd FileType markdown inoremap ,4 ####<Space><Enter><++><Esc>kA
autocmd FileType markdown inoremap ,5 #####<Space><Enter><++><Esc>kA

" the config of nerdtree
" open nerdtree when vim start up.
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" nerdtree shortcut
map <C-n> :NERDTreeToggle<CR>
" close vim when there is only nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
" nerdcommenter config
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1


" vim-table-mode
function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'


if &filetype == "markdown"
    let g:table_mode_corner='|'
else
    let g:table_mode_corner_corner='+'
    let g:table_mode_header_fillchar='='
endif

" vim-easy-align config
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

""
"" tender
"if (has("termguicolors"))
" set termguicolors
"endif
"
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"
"colorscheme tender


"airline config
let g:airline_theme = 'dracula'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts=1
let g:airline#extensions#whitespace#enabled=0
if !exists('g:airline_symbols')
    let g:airline_symbols={}
endif
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#displayed_head_limit = 10
" autocmd BufEnter * call ncm2#enable_for_buffer()

" set completeopt=noinsert,menuone,noselect
" let ncm2#popup_delay = 5
" let g:ncm2#matcher = 'substrfuzzy'

" coc
"autocmd CursorHold * silent call CocActionAsync('highlight')
" plug snazzy
 color snazzy
 let g:SnazzyTransparent = 1
" color dracula
syntax enable
set background=dark

set shortmess+=c
"inoremap <c-c> <ESC>
"inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"au User Ncm2Plugin call ncm2#register_source({
"       \ 'name' : 'css',
"       \ 'priority': 9,
"       \ 'subscope_enable': 1,
"       \ 'scope': ['css','scss'],
"       \ 'mark': 'css',
"       \ 'word_pattern': '[\w\-]+',
"       \ 'complete_pattern': ':\s*',
"       \ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
"       \
"       \})
"
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" highlight for cpp config
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_no_function_highlight = 1

" highlight for python config
let g:python_highlight_all = 1


" vim autoformat config
noremap <F3> :Autoformat<CR>
au BufWrite * :Autoformat
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
autocmd FileType vim,tex let b:autoformat_autoindent=0
let g:formatdef_my_custom_c = '"clang-format -style=\"{BasedOnStyle: llvm, IndentWidth: 4}\" --sort-includes"'
"let g:formatdef_my_custom_c = '"clang-format --style=Google"'
let g:formatters_c = ['my_custom_c']
let g:formatters_cpp = ['my_custom_c']
