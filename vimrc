" vim:fdm=marker
set nocompatible

" Core settings: Appearance {{{
set splitright
set updatetime=1000
set lazyredraw
set ttyfast
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
set fileencoding=utf-8
set encoding=utf-8
set fileformats=unix,dos
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
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o
else
    set undodir=$HOME\vimfiles\backups
    set undofile
    set directory=$HOME\vimfiles\tmp,.
    set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe
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
let mapleader = "\<Space>"
" Use CTRL-S for saving, also in Insert mode
noremap <C-S>		:update<CR>
vnoremap <C-S>		<C-C>:update<CR>
inoremap <C-S>		<C-O>:update<CR>
" Fugitive mappings
nmap <leader>gs :Gstatus<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>ga :Gwrite<CR>
" A mapping for :make
nmap <leader>m :make<CR>
" }}}

" Plugins {{{
" Use pathogen to install vim plugins
runtime bundle/vim-pathogen/autoload/pathogen.vim

let g:pathogen_disabled = []

if !has('ruby')
    call add(g:pathogen_disabled, 'vimux')
    call add(g:pathogen_disabled, 'command-t')
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

" Vimux
map <Leader>rp :VimuxPromptCommand<CR>
map <Leader>rl :VimuxRunLastCommand<CR>
map <Leader>ri :VimuxInspectRunner<CR>
map <Leader>rx :VimuxClosePanes<CR>
map <Leader>rq :VimuxCloseRunner<CR>
map <Leader>rs :VimuxInterruptRunner<CR>
map <Leader>rm :call VimuxRunCommand("scons")<CR>
map <Leader>rt :call VimuxRunCommand("scons test")<CR>

" Command-T
let g:CommandTMaxHeight = 6
let g:CommandTMaxCachedDirectories = 4
let g:CommandTMatchWindowAtTop = 1
let g:CommandTCancelMap='<Esc>'

" }}}

" Programming languages: Go {{{
autocmd FileType go setlocal ts=4 sts=4 sw=4 noexpandtab
autocmd FileType go set makeprg=go\ build
autocmd FileType go set errorformat=%f:%l:%m
" }}}

" Programming languages: C++ {{{
autocmd FileType cpp set makeprg=scons
" }}}

au BufNewFile,BufRead *.ldg,*.ledger setf ledger | comp ledger

" {{{ Hard Mode
set mouse=""
nnoremap <PageUp> <NOP>
nnoremap <PageDown> <NOP>
inoremap <PageUp> <NOP>
inoremap <PageDown> <NOP>
vnoremap <PageUp> <NOP>
vnoremap <PageDown> <NOP>
noremap <MiddleMouse> <NOP>
noremap <MouseUp> <NOP>
noremap <MouseDown> <NOP>
nnoremap <UP> <NOP>
nnoremap <DOWN> <NOP>
nnoremap <LEFT> <NOP>
nnoremap <RIGHT> <NOP>
inoremap <UP> <NOP>
inoremap <DOWN> <NOP>
inoremap <LEFT> <NOP>
inoremap <RIGHT> <NOP>
vnoremap <UP> <NOP>
vnoremap <DOWN> <NOP>
vnoremap <LEFT> <NOP>
vnoremap <RIGHT> <NOP>

" No repetitive HJKL {
" Author: Barry Arthur <bairui @ #vim / freenode>
let g:cursor_moving = 0

function! TrapMovementKeys(key)
    augroup CursorMoving
        autocmd!
        autocmd CursorMoved * let g:cursor_moving += 1
    augroup END
    if g:cursor_moving <= 2
        return a:key
    else
        return ''
    endif
endfunction

nnoremap <expr> h TrapMovementKeys('h')
nnoremap <expr> j TrapMovementKeys('j')
nnoremap <expr> k TrapMovementKeys('k')
nnoremap <expr> l TrapMovementKeys('l')

augroup CursorMovingOff
    autocmd!
    autocmd CursorHold * let g:cursor_moving = 0
augroup END
" }}}
