call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/vim-latex/vim-latex.git'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'elixir-editors/vim-elixir'
Plug 'jvoorhis/coq.vim'
Plug 'rust-lang/rust.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'https://tpope.io/vim/surround.git'
Plug 'https://tpope.io/vim/commentary.git'
Plug 'https://github.com/rhysd/vim-wasm.git'
Plug 'udalov/kotlin-vim'
Plug 'https://github.com/pangloss/vim-javascript.git'
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
Plug 'elmcast/elm-vim'

call plug#end()


"------------------------------------
"*** Auto copy-paste on clipboard ***
"------------------------------------
set clipboard=unnamedplus


"------------------------------------
"********* Normal Settings **********
"------------------------------------
set autoindent
set number


" Tab size
set tabstop=4 " Tab with is 4
set shiftwidth=4 " Indent will have a width of 4
set softtabstop=4 " Set the number of columns for a Tab
set expandtab " Expand Tabs to spaces

autocmd Filetype css setlocal ts=2 sts=2 sw=2
autocmd Filetype scss setlocal ts=2 sts=2 sw=2
autocmd Filetype sass setlocal ts=2 sts=2 sw=2

autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype xml setlocal ts=2 sts=2 sw=2
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2

autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype typescript setlocal ts=2 sts=2 sw=2

autocmd Filetype lisp setlocal ts=4 sts=4 sw=4

autocmd Filetype elm setlocal ts=4 sts=4 sw=4

" Backspace problem
set backspace=2


"------------------------------------
"**** For moving between windows ****
"------------------------------------
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-l> <c-w>l


"------------------------------------
"********* Folding SETTINGS *********
"------------------------------------
set foldmethod=syntax
" set foldlevelstart=1
set foldlevelstart=99

filetype plugin indent on
syntax on


"------------------------------------
" ******** NERDTree SETTINGS ********
"------------------------------------
" For map open NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>
map <C-m> :NERDTreeFind<CR>
nmap <CR> j

" For close NERDTree window automatic
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" cd, CD in NerdTree
set ma


"-----------------------------------
"************ For CoC **************
"-----------------------------------
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
let g:coc_snippet_next = '<tab>'

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()


"-----------------------------------
"******* For Fuzzy Finder  *********
"-----------------------------------
set rtp+=~/.fzf
map <C-f> :FZF<CR>
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

"-----------------------------------
"*********** For Prolog ************
"-----------------------------------
au FileType perl set filetype=prolog

set background = "dark"
imap jk <Esc>
imap Jk <Esc>
imap jK <Esc>
imap kj <Esc>
imap Kj <Esc>
imap KJ <Esc>

"-----------------------------------
"*********** For Airline ***********
"-----------------------------------
" let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'luna'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1

" No accidentally pressing the captial J
nmap J j
vmap J j
nmap K k
vmap K k

" Test disable Ctrl X
map <C-x> l

" make, build/make, build/make test
function UsingMake() 
    nmap <F1> :!make<CR>
    nmap <F2> :!make test<CR>
    nmap <F3> :!make format<CR>:e<CR><CR>
    nmap <F4> :!make release<CR>
endfunction

call UsingMake()
imap <F1> <Nop>
imap <F2> <Nop>
imap <F3> <Nop>
imap <F4> <Nop>

" For Rust
let g:rustfmt_autosave = 1
