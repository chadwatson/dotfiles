filetype off                   " required!

set timeout ttimeoutlen=50

call plug#begin('~/.vim/plugged')

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
Plug 'matze/vim-move'
Plug 'scrooloose/nerdcommenter'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-repeat'
Plug 'eagletmt/ghcmod-vim'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-jdaddy'
Plug 'jiangmiao/auto-pairs'
" Plug 'reasonml-editor/vim-reason-plus'
" Plug 'autozimu/LanguageClient-neovim', {'tag': 'binary-*-x86_64-apple-darwin'}
" Plug 'roxma/nvim-completion-manager'
Plug 'purescript-contrib/purescript-vim'

" Initialize plugin system
call plug#end()

filetype plugin indent on    " required

set rnu
set backspace=indent,eol,start

" By default use 2 spaces
set tabstop=2 softtabstop=0 shiftwidth=2 smarttab expandtab
" Define space/tab rules for certain file type
autocmd Filetype php setlocal shiftwidth=2

set background=dark
colorscheme onedark 
syntax on
set hlsearch

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
map <Leader>w :w<cr>
" map <Leader>qa :qa<cr>
map <Leader>p :set paste<cr>
map <Leader>pn :set nopaste<cr>
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

" JSX Settings
let g:jsx_ext_required = 0

" Merlin Settings
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"

set runtimepath^=~/.vim/bundle/ctrlp.vim

" LanguageClient Settings
" set runtimepath+=~/.vim-plugins/LanguageClient-neovim
" set hidden

" NERDTree Settings

" NERD Commenter Settings
let g:NERDSpaceDelims = 1

" ALE Settings
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier', 'eslint']
let g:ale_fix_on_save = 1
let g:airline#extensions#ale#enabled = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
