"**** For use vim settings *******
"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath
"source ~/.vimrc

call plug#begin('~/.config/nvim/plugged')

Plug 'Valloric/YouCompleteMe', {'do': './install.py --clang-completer'}
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/vim-latex/vim-latex.git'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'python-mode/python-mode', { 'branch': 'develop' }

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
"** Disable backup and swap files ***
"------------------------------------
" set nobackup
" set nowritebackup
" set noswapfile


"------------------------------------
"************ For NodeJS ************
"------------------------------------
au BufNewFile,BufRead *.handlebars set filetype=html


"------------------------------------
"********* Folding SETTINGS *********
"------------------------------------
set foldmethod=syntax
set foldlevelstart=1

let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML


"------------------------------------
"******* Python-mode SETTINGS *******
"------------------------------------
" Pathogen load
" filetype off

" call pathogen#infect()
" call pathogen#helptags()

filetype plugin indent on
syntax on

" let g:pymode_rope_lookup_project = 0
" let g:pymode_rope = 0


"------------------------------------
" ******** NERDTree SETTINGS ********
"------------------------------------
" For auto open NERDTree
" autocmd vimenter * NERDTree

" For map open NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>

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
imap kj <Esc>
imap Kj <Esc>
imap KJ <Esc>
