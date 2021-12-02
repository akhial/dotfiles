set nocompatible " use vim settings

" auto-install vim-plug
if empty(glob("$XDG_DATA_HOME/nvim/site/autoload/plug.vim"))
  silent !curl -fLo "$XDG_DATA_HOME/nvim/site/autoload/plug.vim" --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin()

" plugins
Plug 'vim-airline/vim-airline'      " polybar for vim
Plug 'morhetz/gruvbox'              " gruvbox theme
Plug 'terryma/vim-multiple-cursors' " multi-cursor support
Plug 'tpope/vim-commentary'         " comment stuff out
Plug 'tpope/vim-eunuch'             " *nix file operations
Plug 'tpope/vim-fugitive'           " should be illegal
Plug 'tpope/vim-surround'           " surround with parentheses, brackets, etc.
Plug 'udalov/kotlin-vim'            " kotlin syntax highlighting

call plug#end()

" syntax highlighting
syntax on

" indent behavior
set autoindent smartindent
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

" line wrapping
set nowrap

" general
set nu rnu
set shortmess+=A
set laststatus=2
set splitbelow
set splitright
set showmode
set showcmd
set backspace=indent,eol,start
set encoding=utf-8
set hidden

" Disable bell
set vb
set t_vb=

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
set termguicolors
