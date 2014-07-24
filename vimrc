set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'oplatek/Conque-Shell'
Plugin 'altercation/vim-colors-solarized'

call vundle#end()
filetype plugin indent on

"СЪЕШЬ ЕЩЕ ЭТИХ МЯГКИХ ФРАНЦУЗКИХ БУЛОЧЕК И ВЫПЕЙ ЧАЮ съешь еще этих мягких французких булочек и выпей чаю

let g:solarized_termcolors=256
set t_Co=256
colorscheme solarized
set background=dark

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
"let g:airline_theme = 'luna'
set ttimeoutlen=10
"set noshowmode

let g:syntastic_enable_signs=1
let g:syntastic_always_populate_lock_list=1
let g:syntastic_aggregate_errors=1

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
set novisualbell

set wildmenu
set wildmode=list:longest

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
  autocmd BufEnter *.rb,*.erb,*.scss,*.css,*.js,*rc,*.coffee,*.txt setlocal cursorline cursorcolumn
  autocmd BufLeave *.rb,*.erb,*.scss,*.css,*.js,*rc,*.coffee,*.txt setlocal nocursorline nocursorcolumn
augroup END

set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set smartindent

set wrap
set linebreak
let &colorcolumn=join(range(81,999),",")
"set breakindent
set showbreak=\ \ " comment  so that the whitespace work >.>
"set splitright

set encoding=utf-8
set fileencodings=utf-8,windows-1251
set termencoding=utf-8

set hlsearch
set incsearch
"set nowrapscan
set ignorecase
nnoremap <silent> <CR> :nohlsearch<CR><CR>

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

autocmd VimEnter * NERDTree
map <F10> :NERDTreeToggle<CR>
let NERDTreeWinSize=20
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

cmap <silent> <C-A> <C-^>
imap <silent> <C-A> <C-^>X<Esc>:call MyKeyMapHighlight()<CR>a<C-H>
nmap <silent> <C-A> a<C-^><Esc>:call MyKeyMapHighlight()<CR>
vmap <silent> <C-A> <Esc>a<C-^><Esc>:call MyKeyMapHighlight()<CR>gv
function MyKeyMapHighlight()
  if &iminsert == 0
    hi StatusLine ctermfg=DarkBlue guifg=DarkBlue
  else
    hi StatusLine ctermfg=DarkRed guifg=DarkRed
  endif
endfunction

imap <C-w><C-w> <esc><C-w><C-w>

imap <C-c> <Esc>:ConqueTerm bash<CR>
nmap <C-c> :ConqueTerm bash<CR>
let g:ConqueTerm_InsertOnEnter = 1
let g:ConqueTerm_ReadUnfocused = 1
let g:ConqueTerm_CWInsert = 0
"let g:ConqueTerm_Color = 1

function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
map <Esc>[Z <S-Tab>
ounmap <Esc>[Z
inoremap <S-Tab> <C-P>
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
