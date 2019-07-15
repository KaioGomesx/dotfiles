set nocompatible
set fileformats=unix,dos,mac

syntax on
filetype on

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let g:mapleader = "," 

" Configure vim-plug
call plug#begin('~/.vim/bundle')
    Plug 'junegunn/goyo.vim'
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'scrooloose/syntastic'
    Plug 'tomasr/molokai'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'vim-scripts/AutoComplPop'
    Plug 'Raimondi/delimitMate'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'scrooloose/nerdcommenter'
    Plug 'rking/ag.vim'
    Plug 'sheerun/vim-polyglot'

call plug#end()

nnoremap <leader>g :Goyo <CR>

filetype plugin indent on              " required!

set number
set showmatch
set shiftwidth=2
set completeopt=menu,longest,preview
set softtabstop=2
set tabstop=2
set wildignore=*.o,*~,*.pyc

" Auto change directory to current file's directory
autocmd BufEnter * lcd %:p:h

" This beauty remembers where you were the last time you edited the file, and returns to the same position.
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
                "
" Highlight JSON as javascript -- usefull if you don't want to load json.vim
autocmd BufNewFile,BufRead *.json set ft=javascript

"Trim trailing whitespace in javascript files
autocmd BufWritePre *.js normal m`:%s/\s\+$//e ``
