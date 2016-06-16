" http://dougblack.io/words/a-good-vimrc.html

" Begin Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' " itself, required

Plugin 'tpope/vim-fugitive' " git wrapper
Plugin 'ctrlpvim/ctrlp.vim' " fuzzy file, buffer, mru, tag finder
" Plugin 'Shougo/neocomplete' " autocompletion
Plugin 'Valloric/YouCompleteMe'
Plugin 'sjl/gundo.vim'      " Gundo (advanced undo with U)
Plugin 'fatih/vim-go'
Plugin 'rking/ag.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-rails'
Plugin 'slim-template/vim-slim'
Plugin 'yosssi/vim-ace'
Plugin 'bling/vim-airline'  " statusline plugin
Plugin 'sourcegraph/sourcegraph-vim'

Plugin 'sickill/vim-monokai' " Colorscheme

call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line
" End Vundle

syntax on
syntax enable
set shiftwidth=2 tabstop=2 expandtab
set autoindent
let g:rehash256 = 1
let g:vim_markdown_folding_disabled=1

" vim-go
let g:go_fmt_command = "gofmt"

" neocomplete
let g:neocomplete#enable_at_startup = 1

" neocomplete tab completion
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

let mapleader=","

colorscheme monokai

set grepprg=grep\ -nH\ $*
:imap jj <Esc>

"au BufNewFile,BufRead *.go setf go
"augroup go
"  let g:go_fmt_command = "goimports"
"augroup END

set hidden
set ignorecase smartcase

"move between splits with Ctrl + HJKL
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_

set incsearch           " search as characters are entered
set hlsearch            " highlight matches

set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set cursorcolumn        " highlight the current column
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" highlight last inserted text
nnoremap gV `[v`]

" tree undo
nnoremap U :GundoToggle<CR>

" open ag.vim
nnoremap <leader>a :Ag

" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g "" --ignore-dir=.git'

" Don't show preview windows
set completeopt-=preview

" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" powerline
let g:airline_powerline_fonts = 1
set laststatus=2

" no more arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Tagbar
nmap <F8> :TagbarToggle<CR>

" ctags go config
let s:tlist_def_go_settings = 'go;g:enum;s:struct;u:union;t:type;' .
                           \ 'v:variable;f:function'
