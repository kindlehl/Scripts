"VUNDLE SETUP"

set nocompatible
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required

" Only use YCM if vim > 7.4
if v:version > 704
  Plugin 'Valloric/YouCompleteMe'
endif

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'auto-pairs'
Plugin 'xmledit'
Plugin 'syntastic'
Plugin 'tomtom/tcomment_vim', {'rtp': '~/.vim/bundle/tcomment_vim/plugin'}

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"PLUGIN SETTINGS
"
"
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 3

" Tell code completer to load .ycm_extra_conf.py without asking for
" verification
let g:ycm_confirm_extra_conf = 0

"
"
"END PLUGIN SETTINGS
set path=.,**
set exrc
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set relativenumber
set number
highlight ColorColumn ctermbg=255,255,255
syntax on
set hidden
set wildmenu
set showcmd
set hlsearch
set ignorecase
set smartcase
set backspace=indent,eol,start
set autoindent
set nostartofline
set visualbell
set cmdheight=2
set notimeout ttimeout ttimeoutlen=200
set pastetoggle=<F11>
set novisualbell
map Y y$
set mouse=""f

" Syntastic Begin

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': []  }

autocmd Filetype ruby :set filetype=ruby.chef

" Disable syntastic on zsh file by default
autocmd Filetype zsh let g:syntastic_check_on_open = 0

" Syntastic End

let g:ycm_autoclose_preview_window_after_insertion = 1

let mapleader = ","

nnoremap <leader>cp :set norelativenumber nonumber<Enter>
nnoremap <leader>n :set relativenumber number<Enter>

nnoremap <leader>ev :tabe ~/.vimrc<Enter>
nnoremap <leader>sv :source ~/.vimrc<Enter>

nnoremap <leader>sc :SyntasticCheck<Enter>
nnoremap <leader>st :SyntasticToggleMode<Enter>

inoremap jk <Esc>
inoremap kj <Esc>

" Move current buffer to new tab. Useful for moving the help menu to another
" tab if you constantly refer to it
nnoremap <leader>t <C-W>T


map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration 

"Custom Commands

" Build tag database
" Use ^] to jump to tag under cursor
" Use ^t to jump up  tag stack (like the previous button on a browser)
" Use g^] to for ambiguous tags
command! MakeTags !ctags -R . 
