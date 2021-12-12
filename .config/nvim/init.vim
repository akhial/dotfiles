" Auto-install vim-plug
if empty(glob("$XDG_DATA_HOME/nvim/site/autoload/plug.vim"))
  silent !curl -fLo "$XDG_DATA_HOME/nvim/site/autoload/plug.vim" --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin()

" Plugins
Plug 'vim-airline/vim-airline'      " Polybar for vim
Plug 'morhetz/gruvbox'              " Gruvbox theme
Plug 'terryma/vim-multiple-cursors' " Multi-cursor support
Plug 'tpope/vim-commentary'         " Comment stuff out
Plug 'tpope/vim-eunuch'             " *nix file operations
Plug 'tpope/vim-fugitive'           " Should be illegal
Plug 'tpope/vim-surround'           " Surround with parentheses, brackets, etc.
Plug 'lambdalisue/suda.vim'         " Sudo write
Plug 'udalov/kotlin-vim'            " Kotlin syntax highlighting

call plug#end()

" Syntax highlighting
syntax on

" Indent behavior
set autoindent smartindent
set expandtab
set shiftwidth=4
set tabstop=4

" Line wrapping
set nowrap

" Search behavior
set ignorecase
set smartcase
set incsearch

" General
set nu rnu
set splitbelow
set splitright
set noshowmode
set showcmd
set autoread
set hidden
set shortmess+=A
set laststatus=2
set encoding=utf-8
set backspace=indent,eol,start

" Disable bell
set vb
set t_vb=

" Map Ctrl-C to Escape
inoremap <C-c> <Esc>
nnoremap <C-c> <Esc>
nnoremap r<C-c> r<Esc>
nnoremap <C-w><C-c> <C-w><Esc>

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
    echo "@".getcmdline()
    execute ":'<,'>normal @".nr2char(getchar())
endfunction

" Set theme
set background=dark
colorscheme gruvbox
let g:airline_theme = "gruvbox"
let g:airline_powerline_fonts = 1

" True color support
set termguicolors
