"VimPlug (Plugin Manager)
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'vim-syntastic/syntastic'
Plug 'tomtom/tcomment_vim'
" If installed using git
Plug '~/.fzf'
Plug 'junegunn/goyo.vim'
Plug 'chriskempson/base16-vim'
 
call plug#end()

"***********************************************************"

" --------- FOLDING *****************------------- "

set foldmethod=manual
set foldnestmax=10
set foldenable "//Files open in normal mode
set foldlevel=0

" Persistant folds even after quitting file
" autocmd BufWinLeave ?* mkview
" autocmd BufWinEnter ?* silent loadview 

" Different color for folded lines
hi Folded ctermbg=black

" Refocus folds; close any other fold except the one that you are on
nnoremap ,z zMzvzz

hi Folded cterm=bold
hi FoldColumn cterm=bold


" -------------- COLORSCHEME *********----------------"

" Base16 Colorschemes
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
              
set t_Co=256 
" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
set background=dark
" let g:airline_theme='minimalist'

" Basic Customization
set relativenumber
set number
set encoding=utf-8
set scrolloff=3
set autoindent
" set showmode
" set showcmd
set ignorecase
set smartcase
set nosmartindent
set showmatch
set hidden
set wildmenu
" set wildmode=list:longest
" set visualbell
set cursorline
set linebreak
set wrap
" set ttyfast
set ruler
set backspace=indent,eol,start
" set laststatus=2
" set undofile
let mapleader = " "
let maplocalleader = ","
set noswapfile
set tabstop=8
set shiftwidth=4 
set softtabstop=4
set shiftround
set expandtab
set textwidth=120
set pastetoggle=<F2>
syntax enable

" incremental search 
set incsearch
" set hlsearch

" Making Alt/Meta key work
" set <m-h>=
" set <m-j>= 
" set <m-k>=
" set <m-l>=

" CTAGS
command! MakeTags !ctags -R .
set path+=**

" Use one space, not two, after punctuation.
set nojoinspaces

" set backspace=2 " make backspace work like most other programs

filetype on 
filetype indent on
filetype indent plugin on
set nocompatible
filetype plugin on 
filetype plugin indent on 
" REMAPPINGS
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr> 

" Open new line below and above current line
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>

"Remapping :q :w :wq and :q!
nnoremap <leader>q :q<cr>
nnoremap <leader>s :w<cr>
nnoremap <leader>; :q!<cr>
nnoremap <leader>wq :wq<CR>

" xsel to copy and paste from system clipboard
" vmap <leader>y !xsel -i -b && xsel -b <CR>
" nmap <leader>p :r !xsel -b <CR>

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" Switching between splits

" resize panes
nnoremap <silent> <Right> :vertical resize +5<cr>
nnoremap <silent> <Left> :vertical resize -5<cr>
nnoremap <silent> <Up> :resize +5<cr>
nnoremap <silent> <Down> :resize -5<cr>

" Search in all open buffers (fzf)
nnoremap <leader>f :FZFLines <CR> 

" Toggle GOYO
nnoremap <leader>go :Goyo <CR>

nnoremap <leader>m :NERDTreeToggle<CR> 

" Switch between the last two files
nnoremap <leader><leader> <c-^>
" CUSTOMIZATION

" Open new split panes to right and bottom, which feels more natural
set splitright

" dynamic current window sizing from TBot Art of Vim
set winwidth=85
set winheight=30

set clipboard=unnamedplus

" highlight Comment cterm=italic
highlight Special cterm=bold

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" configure expanding of tabs for various file types
au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.c set noexpandtab
au BufRead,BufNewFile *.h set noexpandtab
au BufRead,BufNewFile Makefile* set noexpandtab

" Make calcurse notes markdown compatible:
autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown

" FZF INTEGRATION (Buffer Switching, locating files, searching through files etc)

" fzf buffer Switching 
function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader>v :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>

" FZF Locating all files on file system
command! -nargs=1 -bang Locate call fzf#run(fzf#wrap(
      \ {'source': 'locate <q-args>', 'options': '-m'}, <bang>0))

" FZF Search lines in all open buffers
function! s:line_handler(l)
  let keys = split(a:l, ':\t')
  exec 'buf' keys[0]
  exec keys[1]
  normal! ^zz
endfunction

function! s:buffer_lines()
  let res = []
  for b in filter(range(1, bufnr('$')), 'buflisted(v:val)')
    call extend(res, map(getbufline(b,0,"$"), 'b . ":\t" . (v:key + 1) . ":\t" . v:val '))
  endfor
  return res
endfunction

command! FZFLines call fzf#run({
\   'source':  <sid>buffer_lines(),
\   'sink':    function('<sid>line_handler'),
\   'options': '--extended --nth=3..',
\   'down':    '60%'
\})
" Vim-Tmux-Navigator (Chris toomey)
" Disable tmux navigator when zooming the Vim pane
" let g:tmux_navigator_disable_when_zoomed = 1
" Syntastic config  
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

map <localleader>s :SyntasticToggleMode<cr> :w<cr>

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
" VIM AIRLINE (Status Line Plugin)

" Automatically display buffers 
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ''
" let g:airline#extensions#tabline#left_alt_sep = ''

" enable modified detection >
" let g:airline_detect_modified=1
"
" " enable paste detection >
" let g:airline_detect_paste=1
"
" " For powerline fonts
" " let g:airline_powerline_fonts = 1
"
" if !exists('g:airline_symbols')
"     let g:airline_symbols = {}
" endif
"
" " unicode symbols
" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'
" let g:airline_symbols.whitespace = 'Ξ'
"
" " airline symbols
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ''
"
" let g:airline#extensions#branch#enabled = 1

" VIM WIKI
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
" COULD BE USEFUL

"     highlight clear CursorLine
"     highlight Normal ctermbg=none
"     highlight Folded ctermbg=none
"     highlight NonText ctermbg=none
"     highlight SpecialKey ctermbg=none
"     highlight VertSplit ctermbg=none
"     highlight SignColumn ctermbg=none

" Colorscheme for .sh
" autocmd BufEnter *.sh colorscheme challenger_deep

" display indentation guides
" set list listchars=tab:❘-,trail:·,extends:»,precedes:«,nbsp:×

" convert spaces to tabs when reading file
" autocmd! bufreadpost * set noexpandtab | retab! 4

" convert tabs to spaces before writing file
" autocmd! bufwritepre * set expandtab | retab! 4

" convert spaces to tabs after writing file (to show guides again)
" autocmd! bufwritepost * set noexpandtab | retab! 4

" if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://sunaku.github.io/vim-256color-bce.html
"    set t_ut=
" endif
