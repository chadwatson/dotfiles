set nocompatible               " be iMprovedg
filetype off                   " required!

set timeout ttimeoutlen=50

call plug#begin('~/.vim/plugged')

"these plugins are useless, but fun
Plug 'koron/nyancat-vim'
Plug 'uguu-org/vim-matrix-screensaver'

" Here are plugins that actually mean something
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'arcticicestudio/nord-vim' 
Plug 'airblade/vim-gitgutter'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'stephenway/postcss.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'jbgutierrez/vim-babel'
Plug 'the-lambda-church/merlin'
Plug 'tpope/vim-fugitive'
Plug 'kchmck/vim-coffee-script'
Plug 'valloric/youcompleteme'
Plug 'tpope/vim-surround'
Plug 'ternjs/tern_for_vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'rking/ag.vim'
Plug 'Chun-Yang/vim-action-ag'
Plug 'terryma/vim-multiple-cursors'
Plug 'danro/rename.vim'
Plug 'w0rp/ale'
Plug 'joshdick/onedark.vim'
Plug 'tpope/vim-unimpaired'
Plug 'styled-components/vim-styled-components'

" Initialize plugin system
call plug#end()

filetype plugin indent on    " required

set rnu
set backspace=indent,eol,start

" By default use 2 spaces
set tabstop=2 softtabstop=0 shiftwidth=2 smarttab expandtab
" Define space/tab rules for certain file type
autocmd Filetype php setlocal shiftwidth=4

set background=dark
colorscheme onedark 
syntax on

" autocmd Filetype gitcommit setlocal spell textwidth=72
" autocmd Filetype txt setlocal spell

let mapleader = " "
let g:ctrlp_map = '<c-p>'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)|node_modules$'
  \ }
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dont_split = 'NERD'

" vim-move Settings

" These maps are for normal mode
map <Leader>nn :Nyancat<CR>
map <Leader>mm :Matrix<CR>
map <Leader>kb :NERDTreeToggle<CR>
map <Leader>8 :noh<CR>
" map <Leader>x :x<cr>
" map <Leader>q :q<cr>
" map <Leader>w :w<cr>
" map <Leader>qa :qa<cr>
" map <Leader>p :set paste<cr>
" map <Leader>pn :set nopaste<cr>
" map <Leader>r :w ! ruby<cr>
" map <Leader>s :w ! rspec<cr>
" map <Leader>df :call delete(expand('%'))<cr>

" These maps are for visual mode
vmap <C-c> y:call system("pbcopy", getreg("\""))<cr>

" Macvim settings
set guioptions-=r
set guioptions-=l
set guioptions-=L
set guioptions-=R
set guifont=Inconsolata:h16
set linespace=6
set list
set listchars=tab:▸·
highlight NonText guifg=#707880
highlight SpecialKey guifg=#707880

" Airline Settings
set laststatus=2
let g:airline_theme = 'hybrid'

" Syntastic Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_javascript_eslint_exe='node_modules/.bin/eslint'

" JSX Settings
let g:jsx_ext_required = 0

" Merlin Settings
" let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
" execute 'set rtp+=' . g:opamshare . '/merlin/vim'

set runtimepath^=~/.vim/bundle/ctrlp.vim

" NERDTree Settings
