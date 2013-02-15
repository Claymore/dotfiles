set nocompatible

" Use pathogen to install vim plugins
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

syntax on
filetype plugin indent on

" Appearance
set background=dark
let g:solarized_termcolors=&t_Co
let g:solarized_termtrans=1
colorscheme solarized

" Powerline
let g:Powerline_symbols='fancy'
let g:Powerline_theme='skwp'
let g:Powerline_colorscheme='skwp'

set laststatus=2 "always show the statusline
