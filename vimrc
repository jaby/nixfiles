syntax on                                       " enable syntax highlighting
set background=dark                             " we like it dark!
try | colorscheme gruvbox | catch | endtry      " use this awesome theme if possible
highlight Pmenu ctermbg=black guibg=black     | " fix popup color so it's easier to read
filetype plugin on                              " load plugins based on file type
filetype indent on                              " load indent settings based on file type
set shiftwidth=2                                " number of spaces to use for indenting
set softtabstop=2                               " number of spaces to use when inserting a tab
set tabstop=2                                   " show tabs as 2 spaces
set expandtab                                   " convert tabs into spaces
set autoindent                                  " copy indent from previous line
set nowrap                                      " don't wrap long lines
set ignorecase smartcase                        " search case-insensitively unless uppercase characters are used
set hidden                                      " allow unsaved buffers to be hidden
set ruler                                       " show cursor line and column in status
set showcmd                                     " show current command in status line
set notimeout                                   " disable timeout for finishing a mapping key sequence
set visualbell                                  " visual bell = no sounds
set undofile                                    " store undo info in a file
set undodir=~/.vim-undo                         " where to store undo info
set dir=~/tmp,/tmp                              " store swap files in $HOME/tmp or /tmp, whichever is available
set scrolloff=3                                 " keep 3 lines visible above/below the cursor when scrolling
set sidescrolloff=7                             " keep 7 characters visible to the left/right of the cursor when scrolling
set sidescroll=1                                " scroll left/right one character at a time
set splitbelow splitright                       " put new windows below or to the right

let g:yankring_clipboard_monitor=0              " don't worry about the system clipboard, thanks YankRing
let g:yankring_n_keys = 'Y D'                   " by default: 'Y D x X', but I don't like x and X adding chars to my yank history
nnoremap x "_x
nnoremap X "_X

let mapleader=" "                               " set <space> as the leader for mappings
nnoremap <space> <nop>

let g:ctrlp_map = '<leader>jf'                  " open ctrl-p fuzzy finder (mnemonic: 'jump file')
nnoremap <Leader>jt :CtrlPTag<CR>
nnoremap <Leader>jb :CtrlPBuffer<CR>
nnoremap <Leader>jj <c-]>

let g:any_jump_disable_default_keybindings = 1  " open AnyJump (mnemonic: 'jump definition')
nnoremap <leader>jd :AnyJump<CR>
xnoremap <leader>jd :AnyJumpVisual<CR>

if has("nvim")
  set inccommand=nosplit                        " show substitutions incrementally
endif

" make escape work in terminal
tnoremap <Esc> <C-\><C-n>

" buffer and window mappings
nmap <leader>w <c-w>
nmap <leader><tab> <c-^>
nmap <leader>wa <c-w>v:A<CR>
nmap <leader>wC :w \| %bd \| e#<CR>

" git mappings
nmap <leader>gb :Gblame<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gph :Gpush<CR>
nmap <leader>gpl :Gpull<CR>

" undo tree
nmap <leader>u :MundoToggle<CR>

" move line mappings
nnoremap <c-j> :m .+1<CR>==
nnoremap <c-k> :m .-2<CR>==

" ignore certain patterns when completing file names
set wildignore+=*/node_modules/*,*/tmp/*,*/target/*,*/build/*

" auto format code
au BufWrite *.rs,*.c,*.h,*.cpp,*.hpp,*.js :ALEFix
au User ALEFixPost :w
let g:ale_linters = { 'c': ['clangd'], 'cpp': ['clangd'] }
let g:ale_fixers = { 'c': ['clang-format'], 'cpp': ['clang-format'], 'javascript': ['prettier'], 'ruby': ['rubocop', 'standardrb'] }
let g:ale_ruby_rubocop_executable = "bundle"
let g:ale_ruby_standardrb_executable = "bundle"
let g:prettier#exec_cmd_async = 1

" restore last line position when opening file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" custom extensions for file types
autocmd BufNewFile,BufRead *.mal set syntax=lisp filetype=lisp

" where to find headers/src files
let g:alternateSearchPath = 'sfr:../src,sfr:../../src,sfr:../include'


let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'LnL7/vim-nix'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'ziglang/zig.vim'
call plug#end()

map <leader>f :Files<CR>

" turn relative line numbers on
:set relativenumber
:set rnu
