" vim:fdm=marker
set nocompatible
set fileencoding=utf-8
set encoding=utf-8

" Core settings: Appearance {{{
set number                      "Line numbers are good
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds

syntax on " Turn syntax highlighting on

set listchars=tab:▸\ ,eol:¬,trail:·
set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points
set laststatus=2 "always show the statusline

if has("gui_running")
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
    set background=light
else
    set background=dark
endif

if has("win32")
    set guifont=Consolas:h14:cRUSSIAN
    language English_US
    set langmenu=English_US
endif
" }}}

" Core settings: Editor {{{
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set autoread                    "Reload files changed outside vim
set hidden
set viminfo='100,f1  "Save up to 100 marks, enable capital marks

" Keep undo history across sessions, by storing in file.

if !has("win32")
    silent !mkdir ~/.vim/backups > /dev/null 2>&1
    set undodir=~/.vim/backups
    set undofile
else
    set undodir=$HOME\vimfiles\backups
    set undofile
    set directory=$HOME\vimfiles\tmp,.
endif
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
set ignorecase
set smartcase        "Case insensitive searches become sensitive with capitals
set hlsearch         "Hilight searches by default
" }}}

" Core settings: Scrolling {{{
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1
" }}}

" Macros {{{
runtime! macros/matchit.vim
" }}}

" Custom mappings {{{
nnoremap [op :set paste<CR>
nnoremap ]op :set nopaste<CR>
nnoremap cop :set paste!<CR>
" }}}

" Plugins {{{
" Use pathogen to install vim plugins
runtime bundle/vim-pathogen/autoload/pathogen.vim

let g:pathogen_disabled = []
if !has('python')
    call add(g:pathogen_disabled, 'UltiSnips')
    call add(g:pathogen_disabled, 'LycosaExplorer')
endif

call pathogen#infect()
call pathogen#helptags()

" Color scheme
let g:solarized_termcolors=&t_Co
let g:solarized_termtrans=1
colorscheme solarized

" Powerline
if !has("win32")
    let g:Powerline_symbols='fancy'
endif
let g:Powerline_theme='skwp'
let g:Powerline_colorscheme='skwp'
" }}}

" Programming languages: Go {{{
autocmd FileType go setlocal ts=4 sts=4 sw=4 noexpandtab
autocmd FileType go set makeprg=go\ build
autocmd FileType go set errorformat=%f:%l:%m
" }}}

au BufNewFile,BufRead *.ldg,*.ledger setf ledger | comp ledger

" {{{ Weaker version of Hard Mode
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
" }}}
