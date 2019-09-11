call plug#begin('~/.config/nvim/plugged')

Plug 'Valloric/YouCompleteMe', {'do': './install.py --clang-completer'}
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/vim-latex/vim-latex.git'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'elixir-editors/vim-elixir'
Plug 'jvoorhis/coq.vim'
Plug 'rust-lang/rust.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'https://tpope.io/vim/surround.git'
Plug 'https://tpope.io/vim/commentary.git'
Plug 'https://github.com/rhysd/vim-wasm.git'
Plug 'https://github.com/pangloss/vim-javascript.git'

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

autocmd Filetype css setlocal tabstop=2
autocmd Filetype css setlocal shiftwidth=2
autocmd Filetype css setlocal softtabstop=2

autocmd Filetype scss setlocal tabstop=2
autocmd Filetype scss setlocal shiftwidth=2
autocmd Filetype scss setlocal softtabstop=2

autocmd Filetype sass setlocal tabstop=2
autocmd Filetype sass setlocal shiftwidth=2
autocmd Filetype sass setlocal softtabstop=2

autocmd Filetype html setlocal tabstop=2
autocmd Filetype html setlocal shiftwidth=2
autocmd Filetype html setlocal softtabstop=2

autocmd Filetype xml setlocal tabstop=2
autocmd Filetype xml setlocal shiftwidth=2
autocmd Filetype xml setlocal softtabstop=2

autocmd Filetype yaml setlocal tabstop=2
autocmd Filetype yaml setlocal shiftwidth=2
autocmd Filetype yaml setlocal softtabstop=2

autocmd Filetype javascript setlocal tabstop=2
autocmd Filetype javascript setlocal shiftwidth=2
autocmd Filetype javascript setlocal softtabstop=2

autocmd Filetype lisp setlocal tabstop=4
autocmd Filetype lisp setlocal shiftwidth=4
autocmd Filetype lisp setlocal softtabstop=4

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
"************ For NodeJS ************
"------------------------------------
au BufNewFile,BufRead *.handlebars set filetype=html
au BufNewFile,BufRead *.ejs set filetype=html


"------------------------------------
"********* Folding SETTINGS *********
"------------------------------------
set foldmethod=syntax
" set foldlevelstart=1
set foldlevelstart=99

let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML


filetype plugin indent on
syntax on

let g:pymode_rope_lookup_project = 0
let g:pymode_rope = 0


"------------------------------------
" ******** NERDTree SETTINGS ********
"------------------------------------
" For auto open NERDTree
" autocmd vimenter * NERDTree

" For map open NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>
map <C-m> :NERDTreeFind<CR>

" For close NERDTree window automatic
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


"-----------------------------------
"******* For YouCompleteMe *********
"-----------------------------------
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_extra_conf.py'
let g:ycm_filepath_completion_use_working_dir=1
let g:ycm_confirm_extra_conf=0
set completeopt-=preview
let g:ycm_filetype_blacklist={'python': 1}


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

" cd, CD in NerdTree
set ma

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
