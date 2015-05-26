set encoding=utf-8
set fileencodings=utf-8,cp950

set t_Co=256
" highlight anything we can
if has("syntax")
	syntax on
endif

set nocompatible " 
set ai           " auto indent
set shiftwidth=4 " 
set tabstop=4    " 
set softtabstop=4
set nowrap
set ruler        " 
set backspace=2  " 
set ru           "

set hlsearch!    " search related
set incsearch    " 
set smartindent  " 
set confirm      " prompt when conflict
set history=100  " 
set cindent shiftwidth=4 expandtab smarttab
set wildignore=*.swp,*.bak,&.pyc
set laststatus=2
set fillchars+=vert:\|
set cul          " highlight current line
hi CursorLine term=bold cterm=bold ctermbg=none      " adjust color

" per-filetype settings
filetype plugin indent on

autocmd FileType c,cpp,slang,cfg,java set cindent shiftwidth=4 expandtab smarttab

autocmd FileType python,bib,bash,sh set shiftwidth=4 expandtab smarttab

autocmd FileType txt set spell spelllang=en_us

" Treat scons files as python
autocmd BufNewFile,BufRead SCons* set filetype=python

" Tell vim to remember certain things when we exit
" "  '10  :  marks will be remembered for up to 10 previously edited files
" "  "100 :  will save up to 100 lines for each register
" "  :20  :  up to 20 lines of command-line history will be remembered
" "  %    :  saves and restores the buffer list
" "  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

function! ResCur()
	if line("'\"") <= line("$")
		normal! g`"
		return 1
	endif
endfunction
    
augroup resCur
autocmd!
autocmd BufWinEnter * call ResCur()
augroup END

" let g:languagetool_jar='/afs/csail.mit.edu/u/p/poantsai/LanguageTool-2.8/languagetool-commandline.jar'

" highlight lines > 80
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/
