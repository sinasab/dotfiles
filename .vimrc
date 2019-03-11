" To start vim without using a vimrc file, use: vim -u NORC or -u NONE

set nocompatible "this must be first bc side effects
highlight LineNr ctermfg=yellow ctermbg=237
au FocusLost * :wa " save when losing focus

" attempt to make backup and swap directories
silent !mkdir ~/.vim > /dev/null 2>&1
silent !mkdir ~/.vim/backup > /dev/null 2>&1
silent !mkdir ~/.vim/swp > /dev/null 2>&1

" here comes the config...
set backupdir=~/.vim/backup// " where backup (~) files go
set clipboard=unnamed " use macos system clipboard
set columns=80
set directory=~/.vim/swp// " where swp files go
set expandtab
set hlsearch " highlight search terms
set ignorecase " ignore case when searching
set list " highlight whitespaces
set modelines=0 " dodges some exploits apparently
set mouse=a
set mousehide
set noerrorbells " don't beep
set notimeout
set nu
set number " always show line numbers
set path+=** " provides tab-completion searching into subfolders
set relativenumber
set shiftround " use multiple of shiftwidth when indenting with < and >
set shiftwidth=2 " number of spaces to use for autoindenting
set showcmd
set showmatch " show matching parens
set showmode
set smartcase " ignore case if search pattern is all lowercase, case-sensitive otherwise
set splitbelow " open horizontal splits to the bottom instead of top
set splitright " open vertical splits to the right instead of left
set statusline=%.40F%=%m\ %Y\ Line:\ %3l/%L[%3p%%]
set tabstop=2 " tab is 4 spaces
" set textwidth=80
set title " change the terminal's title
set ttyfast
" set undofile
set visualbell " don't beep
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=*.swp,*.bak,*.pyc,*.class
set wildignore+=node_modules/*,bower_components/*
set wildmode=list:longest
set wrap
set colorcolumn=85

" file explorer stuff
let g:netrw_liststyle = 3 " use tree list style
let g:netrw_banner = 0 " get rid of banner at the top
let g:netrw_browse_split = 2 " open files in a new vertical split
let g:netrw_winsize = 25 " width of the explorer pane
nnoremap <Leader><Tab> :Vex " keybinding to open tree

" keybindings here
nnoremap gf :vertical wincmd f<CR>
nnoremap <tab> %
vnoremap <tab> %
let mapleader = ","

" use sane regex handling
nnoremap / /\v
vnoremap / /\v

" make j and k scroll to next line in editor, not next line (in case of wrapped line
nnoremap j gj
nnoremap k gk

" remap navigating panes to ex ctrl-j instead of ctrl-w j
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap ; :
nnoremap <space> zz

""""""""""""""""""
" vim plug stuff "
""""""""""""""""""

" Install vim-plug if it's not already
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Install any uninstalled plugins
if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
  autocmd VimEnter * PlugInstall | q
endif

Plug 'tpope/vim-sensible'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'christoomey/vim-tmux-navigator'
" apprentice theme
Plug 'romainl/Apprentice'
Plug 'scrooloose/nerdcommenter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'easymotion/vim-easymotion'

" Plug 'junegunn/vim-easy-align'
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
" Plug 'fatih/vim-go', { 'tag': '*' }
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Initialize plugin system
call plug#end()

colors apprentice