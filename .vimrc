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
Plug 'Rigellute/shades-of-purple.vim'
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
Plug 'neovimhaskell/haskell-vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'purescript-contrib/purescript-vim'
Plug 'jparise/vim-graphql'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mileszs/ack.vim'

" For func argument completion
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

" Initialize plugin system
call plug#end()

filetype plugin indent on    " required

set rnu
set backspace=indent,eol,start

" By default use 2 spaces
set tabstop=2 softtabstop=0 shiftwidth=2 smarttab expandtab
" Define space/tab rules for certain file type
autocmd Filetype php setlocal shiftwidth=2

" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set termguicolors
syntax enable
colorscheme shades_of_purple
set hlsearch

" autocmd Filetype gitcommit setlocal spell textwidth=72
" autocmd Filetype txt setlocal spell

let mapleader = " "

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

" Airline Settings
set laststatus=2
let g:shades_of_purple_airline = 1
let g:airline_theme='shades_of_purple'

" JSX Settings
let g:jsx_ext_required = 0

" Merlin Settings
" let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
" execute "set rtp+=" . g:opamshare . "/merlin/vim"

" LanguageClient Settings
" set runtimepath+=~/.vim-plugins/LanguageClient-neovim
" set hidden

" NERDTree Settings

" NERD Commenter Settings
let g:NERDSpaceDelims = 1

" JavaScript Settings
let g:javascript_plugin_flow = 1

" ALE Settings
let g:ale_linters = {'javascript': ['eslint']}
let g:ale_fixers = {'javascript': ['prettier', 'eslint']}
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_linters_explicit = 1
let g:airline#extensions#ale#enabled = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
highlight clear ALEErrorSign
highlight clear ALEWarningSign
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_statusline_format = ['X %d', '? %d', '']
" %linter% is the name of the linter that provided the message
" %s is the error or warning message
let g:ale_echo_msg_format = '%linter% says %s'

" fzf mappings
nnoremap <c-p> :GFiles<cr>
nmap <Leader>f :GFiles<CR>
nmap <Leader>F :Files<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>h :History<CR>
nmap <Leader>t :BTags<CR>
nmap <Leader>T :Tags<CR>
nmap <Leader>l :BLines<CR>
nmap <Leader>L :Lines<CR>
nmap <Leader>' :Marks<CR>
nmap <Leader>a :Ag<Space>

" coc settings
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" The Silver Searcher support
let g:ackprg = 'ag --nogroup --nocolor --column'
