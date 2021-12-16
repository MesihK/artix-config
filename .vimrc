set nocompatible
set t_Co=256
set background=dark
set nu
syntax on
set title

set hlsearch
set relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

set encoding=utf8

" Don't force me to save when switching buffers
set hidden

"when pasting turn of indendation by pressing F3
set pastetoggle=<F3>

set nowrap
set nobackup
set nowritebackup
set swapfile
set dir=/tmp

nnoremap gb :bp<CR>
nnoremap gn :bn<CR>
nnoremap gl :ls<CR>

set tabstop=4
set expandtab

au BufRead,BufNewFile *.jinja2 set filetype=htmljinja
