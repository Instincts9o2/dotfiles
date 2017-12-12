"VimPlug (Plugin Manager)
call plug#begin('~/.vim/plugged')

Plug 'dylanaraps/wal.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'


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

vmap <leader>y !xsel -i -b && xsel -b <CR>
nmap <leader>p :r !xsel -b <CR>

"Vim Powerline 

"Automatically display buffers 
"let g:airline#extensions#tabline#enabled = 1
"
"function! AccentDemo()
"    let keys = ['a','b','c','d','e','f','g','h']
"    for k in keys
"        call airline#parts#define_text(k, k)
"    endfor
"    call airline#parts#define_accent('a', 'red')
"    call airline#parts#define_accent('b', 'green')
"    call airline#parts#define_accent('c', 'blue')
"    call airline#parts#define_accent('d', 'yellow')
"    call airline#parts#define_accent('e', 'orange')
"    call airline#parts#define_accent('f', 'purple')
"    call airline#parts#define_accent('g', 'bold')
"    call airline#parts#define_accent('h', 'italic')
"    let g:airline_section_a = airline#section#create(keys)
"endfunction
"autocmd VimEnter * call AccentDemo()


"enable modified detection >
let g:airline_detect_modified=1

"enable paste detection >
let g:airline_detect_paste=1

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
