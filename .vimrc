set nocompatible " use vim settings

" install vim-plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugins')

" plugins
" Plug 'udalov/kotlin-vim' " kotlin syntax highlighting support
Plug 'vim-airline/vim-airline' " polybar for vim
Plug 'morhetz/gruvbox'
" Plug 'terryma/vim-multiple-cursors' " multi-cursor support
" Plug 'tpope/vim-surround' " surround with parentheses, brackets, etc.
" Plug 'tpope/vim-fugitive' " git plugin
" Plug 'tpope/vim-repeat' " support '.' repeat for complex commands

call plug#end()

" syntax highlighting
syntax on

" tab behavior
set autoindent
set smartindent
set smarttab
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" line wrapping
set nowrap
set linebreak

" general
set nu rnu
set shortmess+=I
set laststatus=2
set splitbelow
set splitright
set noshowmode
set showcmd
set backspace=indent,eol,start
set encoding=utf-8
set visualbell
set hidden

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
    echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" set theme
set background=dark
colorscheme gruvbox
let g:airline_theme = "gruvbox"
let g:airline_powerline_fonts = 1

" true color support
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

