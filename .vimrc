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

call plug#end()

" tab behavior
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" general
set nu
set shortmess+=I
set laststatus=2
set splitbelow
set splitright
set noshowmode
set backspace=indent,eol,start
set encoding=utf-8

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
if (has("termguicolors"))
  set termguicolors
endif

" italics for palenight
let g:palenight_terminal_italics=1

