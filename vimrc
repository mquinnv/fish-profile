set ch=2		" Make command line two lines high
set mousehide		" Hide the mouse when typing text
set incsearch
let c_comment_strings=1
set hlsearch
set term=builtin_ansi
set et
set sw=2
set smarttab
set ruler
set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%) 
set ts=2
set softtabstop=2
set laststatus=2
map <space> i
imap <C-c> <esc>
set autoindent
set smartindent
set number
filetype plugin on
filetype plugin indent on
cmap w!! %!sudo tee > /dev/null %
set shell=bash\ -i
au BufNewFile,BufRead *.gradle setf groovy
au BufNewFile,BufRead *.xc setf javascript
colorscheme slate
syntax on
autocmd BufNewFile,BufRead * if match(getline(1),"node") >= 0 | set filetype=javascript | endif
execute pathogen#infect()
set ignorecase
set smartcase
if &enc !~? '^u' 
  if &tenc == '' 
    let &tenc = &enc 
  endif 
  set enc=utf-8 
endif 
set fencs=ucs-bom,utf-8,default,iso-8859-5 
setglobal bomb fenc=utf-8 
if has('gui_running') 
  if has('gui_gtk2') 
    set gfn=Courier\ New\ 10 
  elseif has('gui_photon') 
    set gfn=Courier\ New:s10 
  elseif has('gui_kde') 
    set gfn=Courier\ New/10/-1/5/50/0/0/0/1/0 
  elseif has('x11') 
    set gfn=*-courier-medium-r-normal-*-*-100-*-*-m-*-* 
  else 
    set gfn=Courier_New:h10:cDEFAULT 
  endif 
endif 
set t_Co=256
let g:airline_powerline_fonts = 1
let g:syntastic_javascript_checkers = ['jshint']
set clipboard=unnamed
map # :set invnumber <CR> <ESC>
au BufNewFile,BufRead crontab.* set nobackup | set nowritebackup
au BufNewFile,BufRead /private/var/* set nobackup | set nowritebackup
