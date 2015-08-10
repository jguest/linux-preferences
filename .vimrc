execute pathogen#infect()
set term=xterm-256color
syntax on
filetype plugin indent on

set background=dark
colorscheme grb256

set nu
set mouse=nicr

set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

" Mappings
map <C-n> :NERDTreeToggle<CR>

" Aliases
cnoreabbrev SS Sscratch

" Plugins
let g:vim_markdown_folding_disabled=1
