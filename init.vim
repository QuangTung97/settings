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

" if hidden is not set, TextEdit might fail.
set hidden

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


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
" nmap K k
" vmap K k

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
