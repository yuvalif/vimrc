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

" Open Quickfix window automatically after running :make
augroup OpenQuickfixWindowAfterMake
    autocmd QuickFixCmdPost [^l]* nested cwindow
    autocmd QuickFixCmdPost    l* nested lwindow
augroup END

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

" prevent error bells
set noerrorbells visualbell t_vb=

" spell check
set spelllang=en
set spellfile=$HOME/vimrc/en.utf-8.add

" toggle spelling
nnoremap <F9> :set spell!<CR> :syn spell toplevel<CR>
imap <F9> <C-O><F9>

" always look for all tags using c-[
nmap <C-]> g<C-]>

" search up for tags file
set tags=./tags;/

" toggele tagbar
nmap <F6> :TagbarToggle<CR>

" tagbar for golang based on gotags
let g:tagbar_type_go = {
            \ 'ctagstype' : 'go',
            \ 'kinds'     : [
            \ 'p:package',
            \ 'i:imports:1',
            \ 'c:constants',
            \ 'v:variables',
            \ 't:types',
            \ 'n:interfaces',
            \ 'w:fields',
            \ 'e:embedded',
            \ 'm:methods',
            \ 'r:constructor',
            \ 'f:functions'
            \ ],
            \ 'sro' : '.',
            \ 'kind2scope' : {
            \ 't' : 'ctype',
            \ 'n' : 'ntype'
            \ },
            \ 'scope2kind' : {
            \ 'ctype' : 't',
            \ 'ntype' : 'n'
            \ },
            \ 'ctagsbin'  : 'gotags',
            \ 'ctagsargs' : '-sort -silent'
            \ }


" toggele file explorer
nmap <F5> :Explore<CR>

" prevent YCM preview window
set completeopt-=preview

" NERDtree like setup of built in netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3

