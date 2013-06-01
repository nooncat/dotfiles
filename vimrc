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


