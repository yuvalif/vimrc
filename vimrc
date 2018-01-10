"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Based On: http://amix.dk/vim/vimrc.html
" Copyright: Amir Salihefendic http://amix.dk - amix@amix.dk
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Sets how many lines of history VIM has to remember
set history=200

" Enable filetype plugins
filetype plugin on
filetype indent on

" turn on syntax highlight
syntax on

" Set to auto read when a file is changed from the outside
set autoread

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.d

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Use spaces instead of tabs
set expandtab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

set ai "Auto indent
set si "Smart indent

" Always show the status line
set laststatus=2

" Format the status line
set statusline=
set statusline +=\ %n\                      "buffer number
set statusline +=%{&ff}                     "file format
set statusline +=%y                         "file type
set statusline +=\ %<%F                     "full path
set statusline +=%m                         "modified flag
set statusline +=\ \ \ \ \%#todo#<F2>%*Line\ \Numbers
set statusline +=%#todo#<F3>%*Paste\ \Mode
set statusline +=%#todo#<F4>%*Save
set statusline +=%#todo#<F5>%*Make
set statusline +=%#todo#<F6>%*Search\ \Files
set statusline +=%#todo#<F7>%*Search\ \Highlight
set statusline +=%#todo#<F8>%*Jump\ \To\ \Header
set statusline +=\ %=\ line:%l/%L\ (%p%%)   "line out of total
set statusline +=\ column:%v                "column

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
set viminfo^=%

" toggle line number
set number
noremap <F2> :set invnumber<CR>
inoremap <F2> <C-O>:set invnumber<CR>

" toggle paste mode
nnoremap <F3> :set invpaste paste?<CR>
set pastetoggle=<F3>

" save file with F4
map <F4> :w! <CR>

" Open Quickfix window automatically after running :make
augroup OpenQuickfixWindowAfterMake
    autocmd QuickFixCmdPost [^l]* nested cwindow
    autocmd QuickFixCmdPost    l* nested lwindow
augroup END

" make file with F5
map <F5> :make <CR>

" search for the word under the cusrsor
map <F6> :execute "vimgrep /" . expand("<cword>") . "/j **/*.cpp **/*.h" <Bar> cw<CR>

" toggle search highlight
set hlsearch
nnoremap <F7> :set hlsearch!<CR>

" jump between cpp/h file base on https://github.com/derekwyatt/vim-fswitch
map <F8> :FSHere <CR>
let g:fsnonewfiles=1

" allow use of functions and aliases in vim
set shell=bash\ --login

" global search by default
set gdefault

" dynamic search
set incsearch

" make sure syntax is on after buffer delete. minibuffer explorer: https://github.com/fholgado/minibufexpl.vim
let g:miniBufExplForceSyntaxEnable = 1
" have the buffer window on the left
let g:miniBufExplVSplit = 40   " column width in chars

" make difftool more readable
if &diff
    colorscheme evening
endif

" fixing some common typos
ca Q q
ca X x
ca XA xa
ca Xa xa
ca QA qa
ca Qa qa

