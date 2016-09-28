	" set environment
set runtimepath=~/.vim,~/.vim/plugged,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after

" be iMproved
set nocompatible

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" vim-plug
call plug#begin('~/.vim/plugged')

Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/vim-airline/vim-airline-themes'
Plug 'https://github.com/Raimondi/delimitMate'
Plug 'https://github.com/Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/octol/vim-cpp-enhanced-highlight'
Plug 'https://github.com/ConradIrwin/vim-bracketed-paste'
Plug 'https://github.com/wsdjeg/vim-javacomplete2'
Plug 'https://github.com/scrooloose/syntastic'
Plug 'https://github.com/idanarye/vim-vebugger'
Plug 'https://github.com/Shougo/vimproc.vim', {'do' : 'make'}

call plug#end()
" end vim-plug

filetype plugin indent on    " required

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
set hlsearch		" highlight search words
set nostartofline
set wildmenu
set wildmode=longest:full,full
set pastetoggle=<Ins>
set foldmethod=indent
set foldlevel=99

setlocal fo+=aw         " format type for mails
set encoding=utf-8
set termencoding=utf-8
setglobal fileencoding=utf-8
let python_highlight_all=1
syntax on

" textwidth for special filetypes on laptop screen
autocmd FileType text setlocal textwidth=189                                        
autocmd FileType tex setlocal textwidth=189
autocmd BufNewFile,BufRead * if expand('%:t') !~ '\.' | setlocal textwidth=189 | endif	" set all files without extension to textwidth 189

" Don't use Ex mode, use Q for formatting
map Q gq

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" colorscheme Tomorrow-Night-Bright
colorscheme Tomorrow-Night-Bright

" YouCompleteMe
let g:ycm_global_ycm_extra_conf='~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_extra_conf_vim_data=['&filetype']
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" airline
set laststatus=2
let g:airline_theme='serene'

" vim-latexsuite
" set grepprg=grep\ -nH\ $*
" let g:tex_flavor = "latex"
" let g:plaintex_delimiters = 1

" spell check
set spelllang=de 

" delimitMate
let delimitMate_expand_cr = 1

" javacomplete2
let g:JavaComplete_JavaCompiler='/usr/lib/jvm/java-8-openjdk/bin/javac'
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_python_checkers = ['pylint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
