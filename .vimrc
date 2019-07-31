" http://dougblack.io/words/a-good-vimrc.html

" Begin Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' " itself, required

Plugin 'tpope/vim-fugitive' " git wrapper
Plugin 'fatih/vim-go'
Plugin 'ervandew/supertab'
Plugin 'Blackrush/vim-gocode'
Plugin 'mbbill/undotree'
" Plugin 'ntpeters/vim-better-whitespace'
Plugin 'bling/vim-airline'  " statusline plugin
" Plugin 'tpope/vim-abolish'
Plugin 'uarun/vim-protobuf'
" Plugin 'elubow/cql-vim'

" Plugin 'sickill/vim-monokai' " Colorscheme

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
let g:vim_markdown_folding_disabled=1

" supertab
let g:SuperTabDefaultCompletionType = "context"

let mapleader=" "

" colorscheme monokai

set grepprg=grep\ -nH\ $*
inoremap jj <Esc>

set hidden
set ignorecase smartcase

"move between splits with Ctrl + HJKL
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

command Wq wq
command WQ wq
command W w
command Q q

set incsearch           " search as characters are entered
set hlsearch            " highlight matches

set showcmd             " show command in bottom bar
set cursorline          " highlight current line
" set cursorcolumn        " highlight the current column
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]
set splitbelow          " more natural split panes
set splitright          " see above

" https://github.com/tmux/tmux/issues/353#issuecomment-342741778
set ttyfast 
set lazyredraw          " redraw only when we need to.

" turn off search highlight
nnoremap <leader>, :nohlsearch<CR>

" save files with <space><space>
nnoremap <leader><space> :w<CR>

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" highlight last inserted text
nnoremap gV `[v`]

" tree undo
nnoremap U :UndotreeToggle<CR>

" open ag.vim
" nnoremap <leader>a :Ag

" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g "" --ignore-dir=.git'

" Don't show preview windows
" set completeopt-=preview

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

" ctags go config
let s:tlist_def_go_settings = 'go;g:enum;s:struct;u:union;t:type;' .
                           \ 'v:variable;f:function'

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>c <Plug>(go-coverage)
nnoremap <leader>a :lclose<CR>
nnoremap <leader>o :lopen<CR>
nnoremap <leader>n :lnext<CR>
nnoremap <leader>p :lprevious<CR>
nnoremap <leader>i :GoImports<CR>

set backspace=indent,eol,start

" vim-go
let g:go_fmt_command = "gofmt"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_loclist_height = 10
let g:go_quickfix_height = 10
let g:go_list_height = 10
let g:go_jump_to_error = 0
let g:go_list_type = "locationlist"
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

set mouse=n

" fzf
set rtp+=/usr/local/opt/fzf
nnoremap <C-P> :FZF<CR>
inoremap <C-P> :FZF<CR>
