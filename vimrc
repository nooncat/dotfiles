vnoremap < <gv
vnoremap > >gv

map <F2> :NERDTreeToggle<CR>

imap <F4> <Esc>:browse tabnew<CR>
map <F4> <Esc>:browse tabnew<CR>

imap <F5> <Esc> :tabprev <CR>
map <F5> :tabprev <CR>

imap <F6> <Esc> :tabnext <CR>
map <F6> :tabnext <CR>

autocmd VimEnter * NERDTree

autocmd BufEnter * NERDTreeTabsOpen

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
