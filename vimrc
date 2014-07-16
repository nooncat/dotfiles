execute pathogen#infect()

set scrolloff=4
set number
set visualbell
set nobackup
set noswapfile
set showcmd
set hidden
set autoread

set undofile
set undodir=~/.vim/undo/

set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set smartindent

set encoding=utf-8
set fileencodings=utf-8,windows-1251
set termencoding=utf-8

set t_Co=16
"colorscheme solarized
"set background=light

set nocompatible
syntax on
filetype on
filetype indent on
filetype plugin on

set hlsearch
set incsearch
"set nowrapscan
set ignorecase
nnoremap <silent> <C-l> :nohl<CR><C-l>

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

imap <F6> <Esc> :bp <CR>
map <F6> :bp <CR>

imap <F7> <Esc> :bn <CR>
map <F7> :bn <CR>

nmap Q :b#<BAR>bd#<CR>

autocmd VimEnter * NERDTree
let NERDTreeWinSize=15
let NERDTreeShowHidden=0
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme = 'simple'
"set noshowmode

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

imap <C-c> <Esc>:ConqueTerm bash<CR>
nmap <C-c> :ConqueTerm bash<CR>
let g:ConqueTerm_InsertOnEnter = 0
let g:ConqueTerm_ReadUnfocused = 1
let g:ConqueTerm_CWInsert = 1
"let g:ConqueTerm_Color = 1

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
imap <tab> <c-n>
