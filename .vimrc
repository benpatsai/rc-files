set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
Plugin 'user/L9', {'name': 'newL9'}

Plugin 'YouCompleteMe'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

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
colorscheme ron
" per-filetype settings
filetype plugin indent on

" remap short cuts for my fingers...
"
" Switch buffer with space
nmap <Space> <C-w>
" Exit insert mode with double jj 
imap jj <Esc>
" To the end of line with ll
nmap L $
" To the beginning of line with hh
nmap H 0
" Save file with w+enter
nmap W :w<CR>
" Redo the last change with r
nmap r <C-r>
" use ; to substitute :
nmap ; :
" use F5 to show current buffers
nnoremap <Space><Space> :buffers<CR>:buffer<Space>

autocmd FileType c,cpp,go,slang,cfg,java set cindent shiftwidth=4 expandtab smarttab

autocmd FileType python,bib,bash,sh set shiftwidth=4 expandtab smarttab

autocmd FileType txt,tex set spell spelllang=en_us

" Treat scons files as python
autocmd BufNewFile,BufRead SCons* set filetype=python

" Tell vim to remember certain things when we exit
" "  '10  :  marks will be remembered for up to 10 previously edited files
" "  "100 :  will save up to 100 lines for each register
" "  :20  :  up to 20 lines of command-line history will be remembered
" "  %    :  saves and restores the buffer list
" "  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

"function! ResCur()
"	if line("'\"") <= line("$")
"		normal! g`"
"		return 1
"	endif
"endfunction
"    
"augroup resCur
"autocmd!
"autocmd BufWinEnter * call ResCur()
"augroup END

let g:languagetool_jar='/afs/csail.mit.edu/u/p/poantsai/LanguageTool-2.8/languagetool-commandline.jar'

" highlight lines > 80
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/
"
if has('persistent_undo')      "check if your vim version supports it
    set undofile                 "turn on the feature  
    set undodir=$HOME/.vim/undo  "directory where the undo files will be stored
endif

command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction
    
