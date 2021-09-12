set nocompatible            " disable compatibility to old-time vi
set laststatus=2
set encoding=UTF-8
set showmatch               " show matching
set ignorecase              " case insensitive
set mouse=v                 " middle-click paste with
set hlsearch                " highlight search
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=100                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set ttyfast                 " Speed up scrolling in Vim
set cursorline              " highlight current cursorline

" open new split panes to right and below
set splitright
set splitbelow

call plug#begin('~/.vim/plugged')
    Plug 'itchyny/lightline.vim'
    Plug 'fannheyward/coc-marketplace'
    Plug 'ryanoasis/vim-devicons'
    Plug 'flazz/vim-colorschemes'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'scrooloose/nerdtree'
    Plug 'preservim/nerdcommenter'
    Plug 'mhinz/vim-startify'
    Plug 'udalov/kotlin-vim'
    Plug 'tpope/vim-fugitive'
    Plug 'Yggdroot/indentLine'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

colorscheme Monokai

syntax enable

" NerdCommenter settings
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

" Lightline settings
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" indent line settings
let g:indentLine_leadingSpaceChar='·'
let g:indentLine_leadingSpaceEnabled='1'

" Highlight trailing whitespace
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$/

" Mappings
:nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

