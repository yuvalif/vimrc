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

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

set ai "Auto indent
set si "Smart indent

" Always show the status line
set laststatus=2

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

" use ag instead of ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep --ignore tags'
endif
let g:ackhighlight = 1

" Open Quickfix window automatically after running :make
augroup OpenQuickfixWindowAfterMake
    autocmd QuickFixCmdPost [^l]* nested cwindow
    autocmd QuickFixCmdPost    l* nested lwindow
augroup END

" toggle search highlight
set hlsearch
nnoremap <F7> :set hlsearch!<CR>

" fswitch configuration
" jump between cpp/h file base on https://github.com/derekwyatt/vim-fswitch
nnoremap <F8> :FSHere<CR>
" dont generate missing files
let g:fsnonewfiles=1
let g:fsdisablegloc=1
" define basic behavior
au! BufEnter *.c let b:fswitchdst = 'h' | let b:fswitchlocs = '.,../inc,../include,./include,./include/*'
au! BufEnter *.c* let b:fswitchdst = 'h,hpp' | let b:fswitchlocs = '.,../inc,../include,./include,./include/*'
au! BufEnter *.h let b:fswitchdst = 'c,cpp,cc,cxx' | let b:fswitchlocs = '.,../src,..,../..'
au! BufEnter *.hpp let b:fswitchdst = 'cpp,cc,cxx' | let b:fswitchlocs = '.,../src,..,../..'

" allow use of functions and aliases in vim
set shell=bash\ --login

" global search by default
set gdefault

" dynamic search
set incsearch

" minibuffer explorer: https://github.com/fholgado/minibufexpl.vim
nnoremap <F5> :MBEToggle<CR>
nnoremap <F6> :MBEFocus<CR>
nnoremap <tab> :MBEbf<CR>
nnoremap <S-tab> :MBEbb<CR>
" make sure syntax is on after buffer delete. 
let g:miniBufExplForceSyntaxEnable = 1
" have the buffer window on the left
let g:miniBufExplVSplit = 40   " column width in chars
" no need to show numbers
let g:miniBufExplShowBufNumbers = 0

" needed for colors to play well with tmux
set background=dark

if &diff
    " make difftool more readable
    colorscheme murphy
    " allow easy merging using:
    " Ctr-1 select LOCAL
    " Ctr-2 select BASE
    " Cat-3 select REMOTE
    nnoremap <buffer> <C-1> :diffget LOCAL<CR>
    nnoremap <buffer> <C-2> :diffget BASE<CR>
    nnoremap <buffer> <C-3> :diffget REMOTE<CR>
    " look for next/prev diff
    nnoremap <buffer> ] ]c
    nnoremap <buffer> [ [c
    " look for next/prev conflict
    noremap <buffer> } /<<<<<<<<CR>
    noremap <buffer> { ?<<<<<<<<CR>
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

" toggele file explorer
nnoremap <F4> :Explore<CR>

" YCM conf
" prevent YCM preview window
set completeopt-=preview
" don't show doc hover popup
let g:ycm_auto_hover=''
let s:ycm_hover_popup = 0
" load ycm conf by default
let g:ycm_confirm_extra_conf=0
"" cache completion items
let g:ycm_cache_omnifunc=1
"" complete syntax keywords
let g:ycm_seed_identifiers_with_syntax=1
"" less use of the ID completion engine
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_min_num_identifier_candidate_chars = 2
"" use tags as well
let g:ycm_collect_identifiers_from_tags_files = 1

" NERDtree like setup of built in netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3

" handle conf files as ini files
au BufEnter,BufRead *.conf setf dosini

" airline
let g:airline#extensions#whitespace#enabled = 0

" ALE for python and bash
let b:ale_linters = ['pylint', 'shellcheck']
let g:ale_python_pylint_options = '--rcfile ~/.pylintrc'
" let g:ale_completion_enabled = 1
" let g:ale_lint_on_text_changed = 'never'

" toggle column 80 mark
nnoremap <F10> :call Col80Mark()<cr>
hi ColorColumn guibg=#2d2d2d ctermbg=246
let s:colset = 0
function! Col80Mark()
    if s:colset
        set colorcolumn=80
        let s:colset=0
    else
        set colorcolumn=0
        let s:colset=1
    endif
endfunction

