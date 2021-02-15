"auto-install vim-plug                                                                               
let mapleader = ","
let g:mapleader = ","

if empty(glob('~/.config/nvim/autoload/plug.vim'))                                                                                    
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
  Plug 'mattn/emmet-vim'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'preservim/nerdcommenter'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'scrooloose/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'morhetz/gruvbox'
  Plug 'HerringtonDarkholme/yats.vim'
call plug#end()

colorscheme gruvbox

filetype plugin on

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

let g:NERDTreeIgnore = ['^node_modules$']

inoremap <silent><expr> <c-space> coc#refresh()
let g:NERDTreeGitStatusWithFlags = 1


let g:coc_global_extensions = [
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json'
\]

let g:user_emmet_leader_key='<C-Z>'

nmap <C-n> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle
set hidden
syntax on
set nu
set mouse=a
set tabstop=2
set shiftwidth=2
set expandtab
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set encoding=UTF-8
set nowrap

nnoremap <C-s> :w <CR>
nnoremap <C-q> :x <CR>

nnoremap x "_x
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d

nnoremap <leader>d ""d
nnoremap <leader>D ""D
vnoremap <leader>d ""d
