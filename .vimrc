" set environment
set runtimepath=~/.vim,/.vim/bundle,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after,.vim/bundle/vim-javacomplete2

" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}
Plugin 'http://github.com/vim-airline/vim-airline'
Plugin 'http://github.com/vim-airline/vim-airline-themes'
Plugin 'https://github.com/Raimondi/delimitMate'
Plugin 'http://github.com/wsdjeg/vim-javacomplete2'
" Plugin 'http://github.com/Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line	    

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  set undofile		" keep an undo file (undo changes after closing)
endif
set history=10000	" keep 10000 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set number		" show line numbers
set cursorline		" show cursor line

" Don't use Ex mode, use Q for formatting
map Q gq

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

syntax on
set hlsearch

" colorscheme Tomorrow-Night-Bright
colorscheme Tomorrow-Night-Bright

" YouCompleteMe
let g:ycm_global_ycm_extra_conf='/home/alex/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_extra_conf_vim_data=['&filetype']
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" airline
set laststatus=2
let g:airline_theme='serene'

" vim-latexsuite
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

" spell check
set spelllang=de 

" delimitMate
let delimitMate_expand_cr = 1

" javacomplete2
let g:JavaComplete_JavaCompiler='/usr/lib/jvm/java-8-openjdk/bin/javac'
autocmd FileType java setlocal omnifunc=javacomplete#Complete

