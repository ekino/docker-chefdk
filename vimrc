set binary
set nocompatible
set modeline
syntax on

" tab shortcuts
map <C-e> :tabedit 
map <C-n> :tabnew<CR>
map <C-d> :tabclose<CR>
nmap <M-Left> :tabprevious<CR>
nmap <M-Right> :tabnext<CR>

" set default comment color to cyan instead of darkblue
" which is not very legible on a black background
highlight comment ctermfg=cyan

" turn off auto adding comments on next line
" so you can cut and paste reliably
set fo=tcq

" no literal tabs
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" highlight search
set hls

" replace real tabs by '>' char
set list
set listchars=tab:\|>,nbsp:^

" Show me a ruler
set ruler
