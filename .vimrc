"VimPlug (Plugin Manager)
call plug#begin('~/.vim/plugged')

Plug 'dylanaraps/wal.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'rafi/awesome-vim-colorschemes'
""" Colorscheme Approximation """
" This transforms colorschemes to terminal colorschemes
" " The ctermbg=NONE hooks make backgrounds transparent in terminals
"Plug 'godlygeek/csapprox'


call plug#end()

"Keeps background transparent for all colorschemes
function! AdaptColorscheme()
    highlight clear CursorLine
    highlight Normal ctermbg=none
    highlight LineNr ctermbg=none
    highlight Folded ctermbg=none
    highlight NonText ctermbg=none
    highlight SpecialKey ctermbg=none
    highlight VertSplit ctermbg=none
    highlight SignColumn ctermbg=none
endfunction
autocmd ColorScheme * call AdaptColorscheme()


"Folding 
set foldmethod=indent   
set foldnestmax=10
"set nofoldenable //Files open in normal mode
set foldlevel=2

colorscheme tender

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
set laststatus=2
"set undofile
let mapleader = " "
set noswapfile
set tabstop=4
set shiftwidth=4 
set softtabstop=4
set shiftround
set expandtab
"set pastetoggle=<leader>z

syntax enable

"hi Normal ctermbg=none
"highlight NonText ctermbg=none

filetype on 
set nocompatible
filetype plugin on 
filetype plugin indent on 


nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>


"Remapping :q :w and :q!
noremap <leader>q :q<cr>
nnoremap <leader>s :w<cr>
noremap <leader>; :q!<cr>

"needed
set incsearch
"set hlsearch
command! MakeTags !ctags -R .

set path+=**

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

vmap <leader>y !xsel -i -b && xsel -b <CR>
nmap <leader>p :r !xsel -b <CR>

"         Vim airline 

"Automatically display buffers 
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'

"enable modified detection >
let g:airline_detect_modified=1

"enable paste detection >
let g:airline_detect_paste=1

"For powerline fonts
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

    " unicode symbols
 let g:airline_left_sep = '»'
 let g:airline_left_sep = '▶'
 let g:airline_right_sep = '«'
 let g:airline_right_sep = '◀'
 let g:airline_symbols.linenr = '␊'
 let g:airline_symbols.linenr = '␤'
 let g:airline_symbols.linenr = '¶'
 let g:airline_symbols.branch = '⎇'
 let g:airline_symbols.paste = 'ρ'
 let g:airline_symbols.paste = 'Þ'
 let g:airline_symbols.paste = '∥'
 let g:airline_symbols.whitespace = 'Ξ'

     " airline symbols
 let g:airline_left_sep = ''
 let g:airline_left_alt_sep = ''
 let g:airline_right_sep = ''
 let g:airline_right_alt_sep = ''
 let g:airline_symbols.branch = ''
 let g:airline_symbols.readonly = ''
 let g:airline_symbols.linenr = ''

set t_Co=256
let g:airline#extensions#branch#enabled = 1

