set nocompatible            " disable compatibility to old-time vi
set laststatus=2
set encoding=UTF-8
set showmatch               " show matching
set ignorecase              " case insensitive
set smartcase               " smartcase search
set mouse=v                 " middle-click paste with
set hlsearch                " highlight search
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
" set wildmode=longest,list   " get bash-like tab completions
set wildmode=full           " get zsh-like tab completions
set cc=100                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set ttyfast                 " Speed up scrolling in Vim
set cursorline              " highlight current cursorline
set history=200

let mapleader=","
noremap \ ,

" open new split panes to right and below
set splitright
set splitbelow

call plug#begin('~/.vim/plugged')
    Plug 'mhinz/vim-grepper'
 ""   Plug 'valloric/youcompleteme'
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-dispatch'
    Plug 'tpope/vim-obsession'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-unimpaired'
""    Plug 'fannheyward/coc-marketplace'
    Plug 'flazz/vim-colorschemes'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'preservim/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'ryanoasis/vim-devicons'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'preservim/nerdcommenter'
    Plug 'mhinz/vim-startify'
    Plug 'udalov/kotlin-vim'
    Plug 'tpope/vim-fugitive'
    Plug 'Yggdroot/indentLine'
""    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'vim-airline/vim-airline'
    Plug 'majutsushi/tagbar'
    Plug 'ctrlpvim/ctrlp.vim'
    " Plug 'nathanaelkane/vim-indent-guides'
call plug#end()

colorscheme Monokai

syntax enable

" Font settings
""set guifont=Hack\ Nerd\ Font\ Mono\ 11

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
" let g:indent_guides_enable_on_vim_startup = 1

" Highlight trailing whitespace
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$/

" Nerd Tree Git
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusShowIgnored = 1
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
nnoremap <C-k> :CtrlPTag<CR>
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript',
                          \ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/build/*    " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*/build/*  " Windows
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

"######## vim grepper mappings ########
" use ack
nnoremap <leader>g :GrepperAck 
" search for word under cursor
nnoremap <leader>* :GrepperAck -w <c-r>=expand("<cword>")<cr><CR>


" remove unwanted whitespace
:nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

"######## nerd tree mappings ########
nnoremap <leader>t :NERDTreeToggle<CR>
" nnoremap <C-n> :NERDTree<CR>
" nnoremap <C-t> :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>

"######## automatic mark jumps ########
" position last insert
nnoremap <leader>li `^
" position before last jump within current file
nnoremap <leader>lj ``
" position of last change
nnoremap <leader>lc `.
" start of last yank
nnoremap <leader>ys `[
" end of last yank
nnoremap <leader>ye `]
" start of last visual selection
nnoremap <leader>vs `<
" end of last visual selection
nnoremap <leader>ve `>

" pressing %% expands to current directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'


if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif
