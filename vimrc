set nocompatible

set lazyredraw " Do not redraw screen while executing macros
set ttyfast " My TTY is very fast

set splitright
set relativenumber
set showcmd
set showmode
set laststatus=2 " Always show the status line
set showtabline=0 " Hide the tab line
set ruler

set scrolloff=8 " Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

set incsearch
set ignorecase
set smartcase
set hlsearch

set listchars=tab:▸\ ,eol:¬,trail:·

set gcr=a:blinkon0 " Disable blinking cursor
set visualbell " Disable bell

set wildmenu
set autoread
set encoding=utf-8
set fileencoding=utf-8
set fileformats=unix,dos
set history=1000
set nrformats-=octal
set wildignore+=*.swp,*.zip,**/.git/*,**/build/*,*.aux,*.pdf,*.toc
set complete-=i

" Plugins {{{
" Use pathogen to install vim plugins
runtime bundle/vim-pathogen/autoload/pathogen.vim
let g:pathogen_disabled = []

execute pathogen#infect()

" Color scheme
let g:solarized_termcolors=&t_Co
let g:solarized_termtrans=1

" python-syntax
let python_highlight_all = 1

" Command-T
let g:CommandTMaxHeight = 6
let g:CommandTMaxCachedDirectories = 4
let g:CommandTMatchWindowAtTop = 1
let g:CommandTCancelMap='<Esc>'
" }}}

syntax on
filetype plugin indent on
colorscheme solarized

" Mappings {{{
let mapleader = "\<Space>"

nmap <silent> <leader>q :quit<CR>
nmap <leader>; :
nmap <silent> <leader>fs :update<CR>
nmap <silent> <leader>k :bdelete!<CR>

" vim-fugitive
nmap <leader>gs :Gstatus<CR>
nmap <leader>gc :Gcommit<CR>

" vim-counterpoint
nmap ]c :CounterpointNext<CR>
nmap [c :CounterpointPrevious<CR>
nmap <leader>c :CounterpointNext! vsplit<CR>
" }}}

" Programming languages {{{
augroup configgroup
    autocmd!
    autocmd BufNewFile,BufRead SConstruct,SConscript,debscons,rpmscons,tgzscons,txzscons,*.scons set filetype=python
augroup END
" }}}
