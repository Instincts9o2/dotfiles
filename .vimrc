"VimPlug (Plugin Manager)
call plug#begin('~/.vim/plugged')

Plug 'dylanaraps/wal.vim'
Plug 'scrooloose/nerdtree'

call plug#end()

"Folding 
set foldmethod=indent   
set foldnestmax=10
"set nofoldenable //Files open in normal mode
set foldlevel=2

colorscheme wal

set relativenumber
set number
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set ignorecase
set smartcase
set showmatch
set hidden
set wildmenu
"set wildmode=list:longest
"set visualbell
"set cursorline
set linebreak
set wrap
set ttyfast
"set ruler
"set backspace=indent,eol,start
"set laststatus=2
"set undofile
let mapleader = " "
set noswapfile
set tabstop=4
set shiftwidth=4 
set softtabstop=4
set shiftround
set expandtab


syntax enable

filetype on 
set nocompatible
filetype plugin on 
filetype plugin indent on 


nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>


"needed
set incsearch
set hlsearch
command! MakeTags !ctags -R .

set path+=**



" Display extra whitespace
"set list listchars=tab:»·,trail:·,nbsp:·


" Use one space, not two, after punctuation.
set nojoinspaces

" When the type of shell script is /bin/sh, assume a POSIX-compatible shell for syntax highlighting purposes.
"let g:is_posix = 1


map <leader>m :NERDTreeToggle<CR> 

" Switch between the last two files
nnoremap <leader><leader> <c-^>


" display indentation guides
"set list listchars=tab:❘-,trail:·,extends:»,precedes:«,nbsp:×

" convert spaces to tabs when reading file
"autocmd! bufreadpost * set noexpandtab | retab! 4

" convert tabs to spaces before writing file
"autocmd! bufwritepre * set expandtab | retab! 4

" convert spaces to tabs after writing file (to show guides again)
"autocmd! bufwritepost * set noexpandtab | retab! 4

" Switching between vim windows
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
