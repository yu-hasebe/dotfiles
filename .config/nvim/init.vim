syntax on
filetype plugin indent on
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set backspace=2

if !isdirectory(expand('$HOME/.vim/swap'))
    call mkdir(expand('$HOME/.vim/swap'), 'p')
endif
set directory=$HOME/.vim/swap//

set undofile
if !isdirectory(expand('$HOME/.vim/undodir'))
    call mkdir(expand('$HOME/.vim/undodir'), 'p')
endif
set undodir=$HOME/.vim/undodir

noremap <c-h> <c-w><c-h>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>
noremap <c-l> <c-w><c-l>
tnoremap <c-h> <c-w><c-h>
tnoremap <c-j> <c-w><c-j>
tnoremap <c-k> <c-w><c-k>
tnoremap <c-l> <c-w><c-l>

set wildmenu
set wildmode=list:longest,full

set number

set clipboard=unnamed

set tags=tags;

set hlsearch

inoremap { {}<Left>
inoremap [ []<Left>
inoremap ( ()<Left>
inoremap ' ''<Left>
inoremap " ""<Left>
inoremap ` ``<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>

call plug#begin()
	Plug 'neoclide/coc.nvim', { 'branch': 'release' }
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()
