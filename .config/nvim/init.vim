call plug#begin()

Plug 'Chiel92/vim-autoformat'
au BufWrite *.rs,*.go,*.rb,*.js,*.ts,*.html :Autoformat

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
au FileType go setlocal tabstop=4 shiftwidth=4 softtabstop=4 noet
set expandtab
set autoindent
set smartindent
