set encoding=utf-8
set fileencodings=utf-8,windows-1251
set termencoding=utf-8

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rbenv'
Plugin 'tpope/vim-bundler'

Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" check ale others functions
Plugin 'w0rp/ale'
Plugin 'nooncat/vim-colors-solarized'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
"Plugin 'tommcdo/vim-fugitive-blame-ext' not working
"Plugin 'othree/javascript-libraries-syntax.vim'
"Plugin 'othree/yajs.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'kchmck/vim-coffee-script'
Plugin 'leafgarland/typescript-vim'
"Plugin 'jparise/vim-graphq' can't install: requesting github authentication
Plugin 'slim-template/vim-slim'
"Plugin 'evanleck/vim-svelte'
Plugin 'jiangmiao/auto-pairs'
"Plugin 'tpope/vim-endwise'

"Plugin 'wting/gitsessions.vim'

Plugin 'Lokaltog/vim-easymotion'
Plugin 'wincent/ferret'  " build from source https://github.com/ggreer/the_silver_searcher#building-a-release-tarball
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim' " cd ~/.vim/bundle/vimproc.vim  make

Plugin 'Valloric/YouCompleteMe'  "cd ~/.vim/bundle/YouCompleteMe  ./install.py
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'

Plugin 'gregsexton/MatchTag'
"Plugin 'tpope/vim-repeat'
"Plugin 'tpope/vim-surround'
"Plugin 'burnettk/vim-angular'
Plugin 'lyokha/vim-xkbswitch' " http://www.pvsm.ru/vim/31398/print/   options g:XkbSwitchIMappings = ['ru'] not working
Plugin 'nathanaelkane/vim-indent-guides'
"Plugin 'stevearc/vim-arduino'

call vundle#end()
filetype plugin indent on
"set omnifunc=syntaxcomplete#Complete

set regexpengine=0
syntax enable         "should be above colorsetting block
set lazyredraw        "improve scrolling performance
"set synmaxcol=80
set ttyfast
set ttyscroll=3
set mouse=a
set clipboard=unnamedplus

"this was before gnome-terminal 3.18.3
"if system("gconftool-2 --get '/apps/gnome-terminal/profiles/Default/background_color'") == "#fdfdf6f6e3e3\n"

if system("gsettings get 'org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/' background-color") == "'#fdfdf6f6e3e3'\n"
  set background=light
else
  set background=dark
endif

set t_Co=16
"let g:solarized_termcolors=256 "comment for Cygwin & gnome-terminal
colorscheme solarized   "bug sets background to light in fbterm
call togglebg#map("<F3>")
" unmap default plugin's toggle mapping    it's bug: should unmap with plugin
iunmap <F5>
vunmap <F5>
unmap <F5>

let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

set undofile
set undodir=~/.vim/undo/

set scrolloff=4
"set scrolljump=3

set number
noremap <F2> :set invnumber<CR>
" remove underline from current line number highlighting
hi CursorLineNr cterm=none

set title
set nobackup
set noswapfile
set showcmd
set hidden
set autoread
set novisualbell
set noerrorbells
set list
set listchars=trail:·,tab:>-,nbsp:┄   ",eol:¬
set pastetoggle=<F4>
" turn off record mode
" map q <Nop>

"set tags=~/.vimtags

set wildmenu
set wildmode=longest:full,full

set cursorline
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set smartindent

"set textwidth=0
"set columns=80
set wrap
set linebreak
let &colorcolumn=join(range(121,999),",")

set breakindent
set showbreak=\ \ " comment  so that the whitespace work >.>
set backspace=indent,eol,start
"set formatoptions+=t

set hlsearch
set incsearch
"set nowrapscan
" set ignorecase smartcase  " ignore case only when the pattern contains no capital letters
set ignorecase
nnoremap <silent> <CR> :nohlsearch<CR><CR>
nnoremap * *N
vnoremap * y :execute ":let @/=@\""<CR> :execute"set hlsearch"<CR>

let mapleader = ","
nnoremap <leader>s :shell<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

nnoremap <leader>cs :let @+=@%<CR>
nnoremap <leader>cl :let @+=expand("%:p")<CR>

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

nnoremap bv :vsplit<CR>
nnoremap bs :split<CR>
nnoremap bo <C-w>o
nnoremap bd <C-w>q
set splitbelow
set splitright

"section need to change in autocomand nerdtree too
nmap H :bp <CR>
nmap L :bn <CR>
nmap U :b#<BAR>bd#<BAR>b<CR>

"nnoremap <leader>gss :GitSessionSave<cr>
"nnoremap <leader>gsl :GitSessionLoad<cr>
"nnoremap <leader>gsd :GitSessionDelete<cr>

set viminfo='250,h
function! RestoreCursorPos()
  if line("'\"") <= line("$")
    normal! g'"
    return 1
  endif
endfunction

let g:FerretVeryMagic=0
let g:FerretExecutable='ag'
let g:FerretMap=0
nnoremap <leader>a :Ack!<space>
nnoremap <leader>* :Ack! -Q <C-r>=expand('<cword>')<CR><CR>

nmap <leader>t :NERDTreeToggle<CR>
"nmap <leader>r :NERDTreeFind<CR>
"let NERDTreeWinSize = 20
let NERDTreeShowHidden = 0
let NERDTreeQuitOnOpen = 1
"let NERDTreeAutoDeleteBuffer = 1

let g:airline_theme = 'luna'
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_skip_empty_sections = 1 " for hiding after ale checking finish
let g:airline#extensions#ale#checking_symbol="Æ"

let g:airline_symbols = {}
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.dirty='⚡'
"let g:airline_symbols.branch = ''
let g:airline_symbols.linenr = ' L:'
let g:airline_symbols.maxlinenr = ' S:'
let g:airline_symbols.colnr = ''

" https://github.com/vim-airline/vim-airline/issues/1880#issuecomment-468644843
" fix branch section hiding, changed to 100
let g:airline#extensions#branch#displayed_head_limit = 12
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
set ttimeoutlen=10
set noshowmode
set laststatus=2

let g:ale_linters = {
\  'ruby':       ['rubocop', 'mri'],
\  'slim':       ['slimlint'],
\  'javascript': ['eslint']
\}
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] [%severity%] [%code%] %s'

let g:gitgutter_map_keys = 0
set updatetime=300
" lower priority for preventing overiding ale signs
let g:gitgutter_sign_priority = 9


let g:EasyMotion_do_mapping = 0
nmap s <Plug>(easymotion-overwin-f2)
nmap <Leader>l <Plug>(easymotion-overwin-line)
let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ;'
let g:EasyMotion_smartcase=1
let g:EasyMotion_use_smartsign_us = 1

"let ycm_min_num_of_chars_for_completion = 1

let g:UltiSnipsExpandTrigger="<c-j>"
"let g:UltiSnipsUsePythonVersion = 2  "cygwin ycm+ultisnips fixing

let g:unite_winheight = 35
let g:unite_split_rule = 'botright'
call unite#filters#matcher_default#use(['matcher_fuzzy'])
let g:unite_source_rec_async_command = ['ag', '--follow', '--nocolor', '--nogroup', '-g', '']
nnoremap <leader>f :<C-u>Unite -start-insert file_rec/async:!<CR>
nnoremap <silent> <leader>g :<C-u>Unite buffer<CR>
" Ctrl-l unite_redraw / clear cache

let g:XkbSwitchEnabled = 1
let g:XkbSwitchLib = '/usr/local/lib/libg3kbswitch.so'
"let g:XkbSwitchIMappings = ['ru'] "not working and conflicting with ferret
                                   "mapping on global search

" for russian key map in linux without GUI
"set keymap=russian-jcukenwin
"set iminsert=0
"set imsearch=0
"cmap <silent> <C-A> <C-^>
"imap <silent> <C-A> <C-^>X<Esc>:call MyKeyMapHighlight()<CR>a<C-H>
"nmap <silent> <C-A> a<C-^><Esc>:call MyKeyMapHighlight()<CR>
"vmap <silent> <C-A> <Esc>a<C-^><Esc>:call MyKeyMapHighlight()<CR>gv
"function MyKeyMapHighlight()
"  if &iminsert == 0
"    hi Vertsplit ctermbg=240 ctermfg=240
"  else
"    hi Vertsplit ctermbg=27 ctermfg=27
"  endif
"endfunction

augroup vimrc_autocmd
  autocmd!

  " for Ubuntu < 15
  "Cursor shape in insert mode Gnome-terminal.2.x(for 3 too important Default profile).
  "au InsertEnter * silent execute '!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam'
  "au InsertLeave * silent execute '!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block'
  "au VimLeave * silent execute '!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block'

  " for Ubuntu >= 15
  " https://askubuntu.com/questions/731774/how-to-change-gnome-terminal-profile-preferences-using-dconf-or-gsettings
  au InsertEnter * silent execute "!gsettings set 'org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/' cursor-shape ibeam"
  au InsertLeave * silent execute "!gsettings set 'org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/' cursor-shape block"
  au VimLeave * silent execute "!gsettings set 'org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/' cursor-shape block"

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
  "autocmd BufEnter *.*,*file setlocal cursorline cursorcolumn
  "autocmd BufLeave *.*,*file setlocal nocursorline nocursorcolumn
  "autocmd BufEnter NERD_tree_* setlocal cursorline
  "autocmd BufLeave NERD_tree_* setlocal nocursorline

  "NERDTree
  "auto open NERDTree when no files specified (comment out because conficting
  "with gitsessions plugin)
  autocmd STdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

  "close Vim if only NERDTree buffer remain
  autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
  " unmap for prevent NERDTree buffer switching
  autocmd BufEnter NERD_tree_* nunmap H
  autocmd BufLeave NERD_tree_* nmap H :bp <CR>
  autocmd BufAdd * nmap H :bp <CR>
  autocmd BufEnter NERD_tree_* nunmap L
  autocmd BufLeave NERD_tree_* nmap L :bn <CR>
  autocmd BufAdd * nmap L :bn <CR>
  "
  "RestoreCursorPos
  autocmd BufWinEnter * call RestoreCursorPos()

  "set es6 highlighting
  autocmd BufRead,BufNewFile *.es6 setfiletype javascript
  "set html.eruby file type for html snippets working in eruby
  autocmd BufNewFile,BufRead *.html.erb set filetype=html.eruby
  "javascriptlibraries enabling
  "autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
  "autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 1
  "autocmd BufReadPre *.js let b:javascript_lib_use_backbone = 1
  autocmd BufReadPre *.js let b:javascript_lib_use_jasmine = 1
  "autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 1

  "for vim-slim right filetype detection with 'doctype html header' slim file
  autocmd BufNewFile,BufRead *.slim setlocal filetype=slim

  "update signcolumn diffs when save file
  autocmd BufWritePost * GitGutter
  "update signcolumn diffs when exit from :shell
  autocmd CursorHold * GitGutter
  "update signcolumn diffs when switch buffer
  "autocmd BufEnter * GitGutter

  "prevent scroll on buf switch
  if v:version >= 700
    au BufLeave * let b:winview = winsaveview()
    au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
  endif
augroup END

"СЪЕШЬ ЕЩЕ ЭТИХ МЯГКИХ ФРАНЦУЗКИХ БУЛОЧЕК И ВЫПЕЙ ЧАЮ съешь еще этих мягких французких булочек и выпей чаю

