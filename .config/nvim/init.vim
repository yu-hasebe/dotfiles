let g:python_host_prog=$PYENV_ROOT.'/versions/2.7.17/bin/python'
let g:python3_host_prog=$PYENV_ROOT.'/versions/3.8.2/bin/python'

call plug#begin()

Plug 'Chiel92/vim-autoformat'
au BufWrite * :Autoformat

call plug#end()

set number
set hlsearch
set splitbelow
set clipboard=unnamed
set backspace=indent,eol,start

inoremap { {}<Left>
inoremap [ []<Left>
inoremap ( ()<Left>
inoremap ' ''<Left>
inoremap " ""<Left>
inoremap ` ``<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap <<Enter> <><Left><CR><ESC><S-o>

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set smartindent
