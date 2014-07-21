set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree.git'
"Plugin 'scrooloose/syntastic.git'
Plugin 'pthrasher/conqueterm-vim.git'
Plugin 'bling/vim-airline.git'
Plugin 'altercation/vim-colors-solarized.git'

call vundle#end()
filetype plugin indent on

"СЪЕШЬ ЕЩЕ ЭТИХ МЯГКИХ ФРАНЦУЗКИХ БУЛОЧЕК И ВЫПЕЙ ЧАЮ съешь еще этих мягких французких булочек и выпей чаю

let g:solarized_termcolors=256
set t_Co=256
colorscheme solarized
set background=dark

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme = 'solarized'
set ttimeoutlen=10
"set noshowmode

let SessionLoad = 1

set undofile
set undodir=~/.vim/undo/

set scrolloff=4
set number
set nobackup
set noswapfile
set showcmd
set hidden
set autoread
syntax on

set cursorline
set cursorcolumn
highlight CursorLine   ctermbg=236
highlight CursorColumn ctermbg=236
autocmd InsertEnter * highlight CursorLine   ctermbg=233
autocmd InsertLeave * highlight CursorLine   ctermbg=236
autocmd InsertEnter * highlight CursorColumn ctermbg=233
autocmd InsertLeave * highlight CursorColUmn ctermbg=236
autocmd FileType nerdtree setlocal nocursorcolumn
autocmd FileType conque_term setlocal nocursorcolumn nocursorline
augroup NerdCursor
  autocmd!
  autocmd BufEnter NERD_tree_* setlocal cursorline
  autocmd BufLeave NERD_tree_* setlocal nocursorline
augroup END

set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set smartindent

set wrap
set linebreak

set encoding=utf-8
set fileencodings=utf-8,windows-1251
set termencoding=utf-8

set hlsearch
set incsearch
"set nowrapscan
set ignorecase
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>

imap >Ins> <Esc>i

vmap < <gv
vmap > >gv

set viminfo='250,h
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

imap <C-w><C-w> <esc><C-w><C-w>

autocmd VimEnter * NERDTree
map <F10> :NERDTreeToggle<CR>
let NERDTreeWinSize=25
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
