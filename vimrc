execute pathogen#infect()

set scrolloff=4 
set number
set visualbell
set nobackup
set noswapfile
set showcmd
colorscheme solarized

"set autoread

set nocompatible
syntax on
filetype on
filetype indent on
filetype plugin on

"set t_Co=16

imap >Ins> <Esc>i

vmap < <gv
vmap > >gv

function! ResCur()
  if line("'\"") <= line("$")
    normal!  g'"
    return 1
  endif
endfunction
augroup ResCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

imap <F5> <Esc> :bp <CR>
map <F5> :bp <CR>

imap <F6> <Esc> :bn <CR>
map <F6> :bn <CR>

autocmd VimEnter * NERDTree
let NERDTreeWinSize=15
let NERDTreeShowHidden=1

set undofile
set undodir=~/.vim/undo/

set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set smartindent

set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

cmap <silent> <C-F> <C-^>
imap <silent> <C-F> <C-^>X<Esc>:call MyKeyMapHighlight()<CR>a<C-H>
nmap <silent> <C-F> a<C-^><Esc>:call MyKeyMapHighlight()<CR>
vmap <silent> <C-F> <Esc>a<C-^><Esc>:call MyKeyMapHighlight()<CR>gv

function MyKeyMapHighlight()
  if &iminsert == 0
    hi StatusLine ctermfg=DarkBlue guifg=DarkBlue
  else
    hi StatusLine ctermfg=DarkRed guifg=DarkRed
  endif
endfunction

set fileencoding=utf-8
set encoding=utf-8
set termencoding=utf-8

imap <C-c> <Esc>:ConqueTerm bash<CR>
nmap <C-c> :ConqueTerm bash<CR>
let g:ConqueTerm_InsertOnEnter = 0
let g:ConqueTerm_ReadUnfocused = 1

function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
imap <Tab> <C-R>=Tab_Or_Complete()<CR>
set dictionary="/usr/share/dict/british-english-small"
set complete ""
set complete+=.
set complete+=k
set complete+=b
set complete+=t
