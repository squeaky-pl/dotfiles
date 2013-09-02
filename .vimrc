set nocompatible
set noswapfile
set nobackup
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()


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


colors darkspectrum

set list
set lcs=eol:↲,tab:→.,trail:·

set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

set number
set cul
set nowrap
set cc=80

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

nore ; :
map <Leader>p :CtrlPMixed<CR>
map <Leader>n :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '\$py\.class$', '^__pycache__$']
set wildignore=*.pyc,*$py.class,__pycache__
map <Leader>u :GundoToggle<CR>

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


au Syntax * hi ColorColumn ctermbg=black guibg=#222222
au BufEnter * hi ColorColumn ctermbg=black guibg=#222222

let g:syntastic_always_populate_loc_list=1
let g:syntastic_python_checkers=['python', 'pylama', 'py3kwarn']

let g:jedi#usage_command="0"

let g:indentLine_char="│"

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
