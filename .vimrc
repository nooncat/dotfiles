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
set noshowmode

let g:syntastic_enable_signs=1
let g:syntastic_always_populate_lock_list=1
let g:syntastic_aggregate_errors=1

set undofile
set undodir=~/.vim/undo/

xnoremap p pgvy

set scrolloff=4
set number
set nobackup
set noswapfile
set showcmd
set hidden
set autoread
set novisualbell

syntax on
set lazyredraw
"set ttyfast
"syntax sync minlines=256

set wildmenu
set wildmode=longest:full,full

set cursorline
set cursorcolumn
highlight CursorLine   ctermbg=236
highlight CursorColumn ctermbg=236

set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set smartindent

set textwidth=80
set wrap
set linebreak
let &colorcolumn=join(range(81,999),",")
"set breakindent
set showbreak=\ \ " comment  so that the whitespace work >.>
set backspace=indent,eol,start
"set formatoptions+=t
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
function! RestoreCursorPos()
  if line("'\"") <= line("$")
    normal!  g'"
    return 1
  endif
endfunction

imap <F5> <Esc> :bp <CR>
imap <F6> <Esc> :bn <CR>
nmap Q :b#<BAR>bd#<BAR>b<CR>

map <F10> :NERDTreeToggle<CR>
let NERDTreeWinSize=20
let NERDTreeShowHidden=0
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
    hi Vertsplit ctermbg=240 ctermfg=240
  else
    hi Vertsplit ctermbg=27 ctermfg=27
  endif
endfunction

imap <C-w><C-w> <esc><C-w><C-w>

imap <C-c> <Esc>:ConqueTerm bash<CR>
nmap <C-c> :ConqueTerm bash<CR>
let g:ConqueTerm_InsertOnEnter = 0
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

augroup vimrc_autocmd
  autocmd!
  "cursor
  autocmd InsertEnter * highlight CursorLine   ctermbg=233
  autocmd InsertLeave * highlight CursorLine   ctermbg=236
  autocmd InsertEnter * highlight CursorColumn ctermbg=233
  autocmd InsertLeave * highlight CursorColUmn ctermbg=236
  autocmd FileType nerdtree setlocal nocursorcolumn
  autocmd FileType conque_term setlocal nocursorcolumn nocursorline
  autocmd BufEnter NERD_tree_* setlocal cursorline
  autocmd BufLeave NERD_tree_* setlocal nocursorline
  autocmd BufEnter *.rb,*.erb,*.scss,*.css,*.js,*rc,*.coffee,*.txt,*.yml setlocal cursorline cursorcolumn
  autocmd BufLeave *.rb,*.erb,*.scss,*.css,*.js,*rc,*.coffee,*.txt,*.yml setlocal nocursorline nocursorcolumn
  "NERDTree
  autocmd VimEnter * NERDTree
  autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
  autocmd BufEnter NERD_tree_* unmap <F5>
  autocmd BufLeave NERD_tree_* map <F5> :bp <CR>
  autocmd BufAdd * map <F5> :bp <CR>
  autocmd BufEnter NERD_tree_* unmap <F6>
  autocmd BufLeave NERD_tree_* map <F6> :bn <CR>
  autocmd BufAdd * map <F6> :bn <CR>
  "RestoreCursorPos
  autocmd BufWinEnter * call RestoreCursorPos()
  "RubyComplete
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
  autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
augroup END