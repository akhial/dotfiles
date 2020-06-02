set nocompatible " use vim settings

" install vim-plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugins')

" plugins
Plug 'ctrlpvim/ctrlp.vim' " fuzzy file finder
Plug 'udalov/kotlin-vim' " kotlin syntax highlighting support
Plug 'vim-airline/vim-airline' " polybar for vim
Plug 'drewtempelmeyer/palenight.vim' " dark theme
Plug 'terryma/vim-multiple-cursors' " multi-cursor support
Plug 'tpope/vim-surround' " surround with parentheses, brackets, etc.
Plug 'tpope/vim-fugitive' " git plugin
Plug 'scrooloose/nerdtree' " view file directory
Plug 'tpope/vim-repeat' " support '.' repeat for complex commands

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
set nu
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

" NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif   " close vim if the only window left open is a NERDTree
map <F2> :NERDTreeToggle<CR>

" remap capslock to esc when vim starts
au VimEnter * silent !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * silent !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

" set theme
set background=dark
colorscheme palenight
let g:airline_theme = "palenight"

" true color support
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

