" LEADER KEY
let mapleader=","


" COMPATIBILITY
" Set 'nocompatible' to avoid unexpected things that your distro might have
set nocompatible
set t_ut=

" BUNDLE
" Automatically download vim-plug if it doesn't exist
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Configure vim-plug
call plug#begin('~/.vim/bundle')
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  Plug 'reewr/vim-monokai-phoenix'
  Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
  Plug 'heavenshell/vim-tslint'
  Plug 'leafgarland/typescript-vim'
  Plug 'pangloss/vim-javascript'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'Yggdroot/indentLine'
  Plug 'editorconfig/editorconfig-vim'  
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" start deoplete at startup
let g:deoplete#enable_at_startup = 1


" tslint lint on save
autocmd BufWritePost *.ts,*.tsx call tslint#run('a', win_getid())

" indent line types
let g:indentLine_char_list = ['┊']

" SYNTAX
" Enable syntax highlighting
syntax on

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" SEARCH
" Highlight search term. Use :nohl to redraw screen and disable highlight
set hlsearch

" Make Ag search from your project root
let g:ag_working_path_mode="r"

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase


" AUTO IDENTATION
" Enable auto identation with 'spaces' instead of 'tabs'
set smartindent
set expandtab
set softtabstop=2
set shiftwidth=2

" ctrlp ignore node_modules
let g:ctrlp_custom_ignore = 'node_modules'


" MOVING BETWEEN FILES
" Set 'hidden' if you want to open a new file inside the same buffer without the
" need to save it first (if there's any unsaved changes).
set hidden


" REMEMBER THIGS
" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
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


" BACKUP
" Disable all backup files, never used them
set nobackup
set nowritebackup
set noswapfile

" COLOR SCHEME
" Load molokai (alternative to Monokai from TextMate) color scheme
colorscheme monokai-phoenix

" FONT
set guifont=Cascadia\ Code:h14
set antialias

" ENCODING
set encoding=utf-8

" COMMAND LINE
" Enhanced command line completion
set wildmenu

" Complete files like a shell
set wildmode=list:longest

" SEARCH
" Vim will start searching as you type
set incsearch

" Enable Mouse
set mouse=a

" FILE NUMBERS
" Enable relative and absolute file numbers
set number

" WRAP
" Stop wrapping long lines
set nowrap

" AUTORELOAD
" Automatically reload buffers when file changes
set autoread

" PLUGINS CONFIGURATIONS

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" prettier enable autoFormat
let g:prettier#autoformat = 1


" Syntastic
nnoremap <leader>st :SyntasticToggleMode<cr>

" NERDTree
nnoremap <leader>ft :NERDTreeToggle<cr>
