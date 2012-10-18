" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2000 Oct 14
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

let g:xml_syntax_folding=1

au FileType xml setlocal foldmethod=syntax

au FileType php let php_sql_query = 1
au FileType php let php_baselib = 1
au FileType php let php_htmlInStrings = 1
au FileType php let php_folding = 1

syntax on
filetype plugin on
filetype indent on

"hi Identifier     term=underline  ctermfg=white ctermbg=black
"hi Statement      term=bold  ctermfg=2 
"hi Special        term=bold  ctermfg=6 ctermbg=black

"set textwidth=72
"set wrap
"set linebreak
set bs=2		" allow backspacing over everything in insert mode
set ai			" always set autoindenting on
set si
set fo+=r
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set noautoindent
set ts=4
set shiftwidth=4
set laststatus=2
set statusline=%<%f%=%(%h%m%r%=\ %l,%c%V\ %P%)
set incsearch
set wmh=0
set nohlsearch

" window navigation
map <C-j> <C-W>j<C-W>_
imap <C-j> <C-W>j<C-W>_
map <C-k> <C-W>k<C-W>_
imap <C-k> <C-W>k<C-W>_
map <C-h> <C-W>h
imap <C-h> <C-W>h
map <C-l> <C-W>l
imap <C-l> <C-W>l

" NERDTree
map <F8> :NERDTreeToggle<CR>
imap <F8> :NERDTreeToggle<CR>

" Tagbar
map <F9> :TagbarToggle<CR>
imap <F9> :TagbarToggle<CR>

" Tabs
map <C-a> :tabprevious<CR>
imap <C-a> :tabprevious<CR>
map <C-d> :tabnext<CR>
imap <C-d> :tabnext<CR>
map <C-f> :tabnew<CR>
imap <C-f> :tabnew<CR>


" colorscheme mycolors

hi Folded cterm=bold ctermfg=red ctermbg=0
hi StatusLine term=bold cterm=bold ctermfg=yellow ctermbg=0

au BufNewFile,BufRead * exe "normal \<C-j>\<C-k>"

set tags=./tags

fun! ShowFuncName()
  let lnum = line(".")
  let col = col(".")
  echohl ModeMsg
  echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$\\|^\\s*private\\s\\+function\\s\\+\\|public\\s\\+function\\s\\+\\|protected\\s\\+function\\s\\+\\|procedure\\|function\\s\\+\.*(", 'bW'))
  echohl None
  call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfun

fun! ShowClassName()
  let lnum = line(".")
  let col = col(".")
  echohl ModeMsg
  echo getline(search("^\\s*class\\s\\+\\|^\\s*abstract\\s\\+class\\s\\+\\|^\\s*final\\s\\+class\\s\\+", 'bW'))
  echohl None
  call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfun

map f :call ShowFuncName() <CR>
map c :call ShowClassName() <CR>

call pathogen#infect()


