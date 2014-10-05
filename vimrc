set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-rails'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'oplatek/Conque-Shell'
Plugin 'altercation/vim-colors-solarized'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'

call vundle#end()
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

"СЪЕШЬ ЕЩЕ ЭТИХ МЯГКИХ ФРАНЦУЗКИХ БУЛОЧЕК И ВЫПЕЙ ЧАЮ съешь еще этих мягких французких булочек и выпей чаю

syntax on "must be above colorsetting block
set lazyredraw
"set regexpengine=1    "for Vim version > 7.3.969
"set synmaxcol=80
"set ttyfast
"set ttyscroll=3

set background=dark
let g:solarized_termcolors=256
colorscheme solarized

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme = 'dark'
set ttimeoutlen=10
set noshowmode
set laststatus=2
let g:airline_powerline_fonts = 1

let g:syntastic_enable_signs=1
let g:syntastic_always_populate_lock_list=1
let g:syntastic_aggregate_errors=1

set undofile
set undodir=~/.vim/undo/

set scrolloff=4
"set scrolljump=3
set number
set nobackup
set noswapfile
set showcmd
set hidden
set autoread
set novisualbell
set noerrorbells

set wildmenu
set wildmode=longest:full,full

"highlight SignColumn   ctermbg=234  //or fix Solarized.vim str.657 to: exe hi! SignColumn" .s:fmt_none .s:fg_blue .s:bg_none

highlight CursorLine   ctermbg=236
highlight CursorColumn ctermbg=236

set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set smartindent

"set textwidth=0
"set columns=80
set wrap
set linebreak
let &colorcolumn=join(range(81,999),",")
"set breakindent
set showbreak=\ \ " comment  so that the whitespace work >.>
set backspace=indent,eol,start
"set formatoptions+=t
set splitright

set encoding=utf-8
set fileencodings=utf-8,windows-1251
set termencoding=utf-8

set hlsearch
set incsearch
"set nowrapscan
set ignorecase
nnoremap <silent> <CR> :nohlsearch<CR><CR>
nnoremap * *N
vnoremap * y :execute ":let @/=@\""<CR> :execute "set hlsearch"<CR>

xnoremap p pgvy
nnoremap j gj
nnoremap k gk
imap >Ins> <Esc>i
vmap < <gv
vmap > >gv
nnoremap <space>o o<ESC>
nnoremap <space>O O<ESC>
imap <C-D> <C-O>x

imap <C-w><C-w> <esc><C-w><C-w>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"imap <F4> <Esc> :bp <CR>
"imap <F5> <Esc> :bn <CR>
"nmap Q :b#<BAR>bd#<BAR>b<CR>
map bh :bp <CR>
map bl :bn <CR>
map bn :new <CR>
map bv :vnew <CR>
map bd :b#<BAR>bd#<BAR>b<CR>

set viminfo='250,h
function! RestoreCursorPos()
  if line("'\"") <= line("$")
    normal!  g'"
    return 1
  endif
endfunction

if !exists( "*RubyEndToken" )
  function RubyEndToken()
    let current_line = getline( '.' )
    let braces_at_end = '{\s*\(|\(,\|\s\|\w\)*|\s*\)\?$'
    let stuff_without_do = '^\s*\(class\|if\|unless\|begin\|case\|for\|module\|while\|until\|def\)'
      let with_do = 'do\s*\(|\(,\|\s\|\w\)*|\s*\)\?$'

      if match(current_line, braces_at_end) >= 0
        return "\<CR>}\<C-O>O"
      elseif match(current_line, stuff_without_do) >= 0
        return "\<CR>end\<C-O>O"
      elseif match(current_line, with_do) >= 0
        return "\<CR>end\<C-O>O"
      else
        return "\<CR>"
      endif
    endfunction
endif
imap <CR> <C-R>=RubyEndToken()<CR>

nmap nt :NERDTreeToggle<CR>
let NERDTreeWinSize=20
let NERDTreeShowHidden=0
let NERDTreeQuitOnOpen = 1
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
  autocmd BufEnter *.*,*file setlocal cursorline cursorcolumn
  autocmd BufLeave *.*,*file setlocal nocursorline nocursorcolumn
  autocmd BufEnter NERD_tree_* setlocal cursorline
  autocmd BufLeave NERD_tree_* setlocal nocursorline

  "conque_term scrolloff reseting fix
  autocmd BufLeave bash* set scrolloff=4

  "NERDTree
  autocmd VimEnter * NERDTree
  autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
  "autocmd BufEnter NERD_tree_* unmap <F4>
  "autocmd BufLeave NERD_tree_* map <F4> :bp <CR>
  "autocmd BufAdd * map <F4> :bp <CR>
  "autocmd BufEnter NERD_tree_* unmap <F5>
  "autocmd BufLeave NERD_tree_* map <F5> :bn <CR>
  "autocmd BufAdd * map <F5> :bn <CR>
  "
  "RestoreCursorPos
  autocmd BufWinEnter * call RestoreCursorPos()

  "RubyComplete
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
  autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

augroup END
