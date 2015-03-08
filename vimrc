set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-rails'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'   " sudo npm install -g jsint/jshint
Plugin 'oplatek/Conque-Shell'
Plugin 'altercation/vim-colors-solarized'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'jiangmiao/auto-pairs'
"Plugin 'tpope/vim-endwise'
Plugin 'Valloric/YouCompleteMe'  "cd ~/.vim/bundle/YouCompleteMe  ./install.sh
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'tpope/vim-repeat'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'gregsexton/MatchTag'
"Plugin 'tpope/vim-surround'
"Plugin 'kien/ctrlp.vim'
"Plugin 'burnettk/vim-angular'

call vundle#end()
filetype plugin indent on
"set omnifunc=syntaxcomplete#Complete

set regexpengine=1    "for Vim version > 7.3.969
syntax enable         "must be above colorsetting block
set lazyredraw
"set synmaxcol=80
set ttyfast
set ttyscroll=3

set background=dark
set t_Co=16
"let g:solarized_termcolors=256
colorscheme solarized   "bug sets background to light in fbterm
call togglebg#map("<F5>")

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme = 'dark'
let g:airline_powerline_fonts = 1
set ttimeoutlen=10
set noshowmode
set laststatus=2

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_lock_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_loc_list_height = 8
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_javascript_checkers = ['jslint']

let g:gitgutter_map_keys = 0

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
set list
set listchars=trail:·,tab:>-   ",eol:¬, trail:∙
set pastetoggle=<F4>
"map q <Nop>  // turn off record mode

set wildmenu
set wildmode=longest:full,full

let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

"highlight SignColumn   ctermbg=234  //or fix Solarized.vim str.657 to: exe hi! SignColumn" .s:fmt_none .s:fg_blue .s:bg_none

"highlight CursorLine   ctermbg=236
"highlight CursorColumn ctermbg=236
set cursorline
"set cursorcolumn
"if &background=="dark"
"  highlight CursorLine   ctermbg=236
"  highlight CursorColumn ctermbg=236
"else
"  highlight CursorLine   ctermbg=186
"  highlight CursorColumn ctermbg=186
"endif

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

set breakindent
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
vnoremap * y :execute ":let @/=@\""<CR> :execute"set hlsearch"<CR>

let mapleader = ","
nnoremap <leader>s :shell<CR>

let g:EasyMotion_do_mapping = 0
nmap s <Plug>(easymotion-s2)
let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ;'
let g:EasyMotion_smartcase=1
let g:EasyMotion_use_smartsign_us = 1
"map  / <Plug>(easymotion-sn)
"map  n <Plug>(easymotion-next)
"map  N <Plug>(easymotion-prev)
"map <Leader>l <Plug>(easymotion-lineforward)
"map <Leader>j <Plug>(easymotion-j)
"map <Leader>k <Plug>(easymotion-k)
"map <Leader>h <Plug>(easymotion-linebackward)
"let g:EasyMotion_startofline = 0

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

"section need to change in autocomand nerdtree too
nmap H :bp <CR>
nmap L :bn <CR>
nmap U :b#<BAR>bd#<BAR>b<CR>

set viminfo='250,h
function! RestoreCursorPos()
  if line("'\"") <= line("$")
    normal!  g'"
    return 1
  endif
endfunction

nmap <leader>t :NERDTreeToggle<CR>
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

augroup vimrc_autocmd
  autocmd!
  "cursor shape in insert mode Gnome-terminal
  au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
  au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
  au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"

  "cursor for server linux
  "  autocmd InsertEnter * highlight CursorLine   ctermbg=233
  "  autocmd InsertLeave * highlight CursorLine   ctermbg=236
  "  autocmd InsertEnter * highlight CursorColumn ctermbg=233
  "  autocmd InsertLeave * highlight CursorColUmn ctermbg=236
  "if &background=="dark"
  "  autocmd InsertEnter * highlight CursorLine   ctermbg=233
  "  autocmd InsertLeave * highlight CursorLine   ctermbg=236
  "  autocmd InsertEnter * highlight CursorColumn ctermbg=233
  "  autocmd InsertLeave * highlight CursorColUmn ctermbg=236
  "else
  "  autocmd InsertEnter * highlight CursorLine   ctermbg=253
  "  autocmd InsertLeave * highlight CursorLine   ctermbg=186
  "  autocmd InsertEnter * highlight CursorColumn ctermbg=253
  "  autocmd InsertLeave * highlight CursorColUmn ctermbg=186
  "endif
  "autocmd FileType nerdtree setlocal nocursorcolumn
  "autocmd FileType conque_term setlocal nocursorcolumn nocursorline
  "autocmd BufEnter *.*,*file setlocal cursorline cursorcolumn
  "autocmd BufLeave *.*,*file setlocal nocursorline nocursorcolumn
  "autocmd BufEnter NERD_tree_* setlocal cursorline
  "autocmd BufLeave NERD_tree_* setlocal nocursorline

  "conque_term scrolloff reseting fix & trailing chars
  autocmd BufLeave bash* set scrolloff=4
  autocmd BufEnter bash* setlocal nolist

  "NERDTree
  autocmd VimEnter * NERDTree
  autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
  autocmd BufEnter NERD_tree_* nunmap H
  autocmd BufLeave NERD_tree_* nmap H :bp <CR>
  autocmd BufAdd * nmap H :bp <CR>
  autocmd BufEnter NERD_tree_* nunmap L
  autocmd BufLeave NERD_tree_* nmap L :bn <CR>
  autocmd BufAdd * nmap L :bn <CR>
  "
  "RestoreCursorPos
  autocmd BufWinEnter * call RestoreCursorPos()

  "javascriptlibraries enabling
  "autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
  "autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 1
  "autocmd BufReadPre *.js let b:javascript_lib_use_backbone = 1
  "autocmd BufReadPre *.js let b:javascript_lib_use_jasmine = 1
  "autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 1

augroup END

"СЪЕШЬ ЕЩЕ ЭТИХ МЯГКИХ ФРАНЦУЗКИХ БУЛОЧЕК И ВЫПЕЙ ЧАЮ съешь еще этих мягких французких булочек и выпей чаю

