" vim:fdm=marker
set nocompatible

" Core settings: Appearance {{{
set number                      "Line numbers are good
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds

syntax on " Turn syntax highlighting on

set listchars=tab:▸\ ,eol:¬
set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points
set background=dark
set laststatus=2 "always show the statusline
" }}}

" Core settings: Editor {{{
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set autoread                    "Reload files changed outside vim
set hidden
set viminfo='100,f1  "Save up to 100 marks, enable capital marks

" Keep undo history across sessions, by storing in file.

silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile
" }}}

" Core settings: Identation {{{
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
filetype plugin indent on
" }}}

" Core settings: Search {{{
set incsearch        "Find the next match as we type the search
set smartcase        "Case insensitive searches become sensitive with capitals
set hlsearch         "Hilight searches by default
" }}}

" Macros {{{
runtime! macros/matchit.vim
" }}}

" Custom mappings {{{
set pastetoggle=<F2>
nmap <leader>l :set list!<CR>
" }}}

" Plugins {{{
" Use pathogen to install vim plugins
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

" Color scheme
let g:solarized_termcolors=&t_Co
let g:solarized_termtrans=1
colorscheme solarized

" Powerline
let g:Powerline_symbols='fancy'
let g:Powerline_theme='skwp'
let g:Powerline_colorscheme='skwp'
" }}}
