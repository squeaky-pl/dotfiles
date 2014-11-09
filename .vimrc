set nocompatible
set noswapfile
set nobackup
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()


Bundle 'gkz/vim-ls'
Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'sjl/gundo.vim.git'
Bundle 'davidhalter/jedi-vim'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/syntastic'
Bundle 'tomtom/tlib_vim'
Bundle 'MarcWeber/vim-addon-mw-utils.git'
Bundle 'bling/vim-airline'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Yggdroot/indentLine'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'tpope/vim-repeat'
Bundle 'garbas/vim-snipmate'
Bundle 'spiiph/vim-space'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'maxbrunsfeld/vim-yankstack'
Bundle 'embear/vim-localvimrc'
Bundle 'szw/vim-ctrlspace'
Bundle 'sheerun/vim-polyglot'
Bundle 'michaeljsmith/vim-indent-object'

colors darkspectrum

set list
set lcs=eol:↲,tab:→.,trail:·,nbsp:␣

set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

set number
set relativenumber
set cul
set nowrap
set cc=80

set scrolloff=3

set incsearch
set hlsearch
set ignorecase
set smartcase

syntax on
filetype plugin indent on

set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
set laststatus=2

" split windows on the right and bottom
set splitbelow
set splitright

set clipboard=unnamedplus

set mouse=a

nore ; :
map <Leader>p :CtrlPMixed<CR>
map <Leader>n :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '\$py\.class$', '^__pycache__$', '^node_modules$']
set wildignore=*.pyc,*$py.class,__pycache__
map <Leader>u :GundoToggle<CR>

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


au FileType rst set spell

au Syntax * hi ColorColumn ctermbg=234 guibg=#111111
au BufEnter * hi ColorColumn ctermbg=234 guibg=#111111

hi CtrlSpaceSelected term=reverse ctermfg=187  ctermbg=23  cterm=bold
hi CtrlSpaceNormal   term=NONE    ctermfg=244  ctermbg=232 cterm=NONE
hi CtrlSpaceFound    ctermfg=220  ctermbg=NONE cterm=bold

let g:syntastic_always_populate_loc_list=1
let g:syntastic_python_checkers=['python', 'pylama', 'py3kwarn']
let g:syntastic_error_symbol='✖'
let g:syntastic_style_error_symbol='⌁'
let g:syntastic_style_warning_symbol='✠'
let g:syntastic_warning_symbol='✗'

let g:jedi#usage_command=""

let g:indentLine_char="│"
let g:indentLine_color_term = 239

let g:airline_powerline_fonts=1
let g:airline_exclude_preview = 1

let g:localvimrc_sandbox = 0

let python_highlight_builtins = 1
let python_highlight_exceptions = 1
let python_highlight_string_formatting = 1

nmap <leader>y <Plug>yankstack_substitute_older_paste
nmap <leader>Y <Plug>yankstack_substitute_newer_paste

" Delete trailing white space on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.js :call DeleteTrailingWS()
autocmd BufWrite *.html :call DeleteTrailingWS()
autocmd BufWrite *.rst :call DeleteTrailingWS()
autocmd BufWrite *.ls :call DeleteTrailingWS()

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
