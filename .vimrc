execute pathogen#infect()

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"
" " The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.

Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'kburdett/vim-nuuid'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'

" " All of your Plugins must be added before the following line
call vundle#end()            " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set autoread
set nocompatible
set hidden
set number
set ruler
set history=50
set showcmd
filetype plugin indent on
set backspace=eol,indent,start
set vb
" Highlights cursor line
set cursorline

" Set high undo levels
set undolevels=300

" Turn off the fucking recording key that is absolutely useless
"nnoremap q <nop>

" jj to escape insert mode
inoremap jj <Esc>

"Shortcuts using leader
"Fast Saving
nnoremap <C-w> :w!<cr>
nnoremap <C-x> :x<cr>

" Keep cursor away from edges
set scrolljump=5
set scrolloff=3

" Set 80 character line length marker
set colorcolumn=80

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab Spacing
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set autoindent

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search Related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set incsearch
set hlsearch
" Ignore case during search
set ic

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctrl+n to toggle NERDTree
map <C-n> :NERDTreeToggle %<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"let g:NERDTreeDirArrowExpandable = '>'
"let g:NERDTreeDirArrowCollapsible = '>'
let NERDTreeShowHidden=1

" Airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':p:.'
let g:airline#extensions#tabline#fnamecollapse = 0

" Solarized Settings
syntax enable
set background=dark
colorscheme solarized
let g:solarized_termcolors=256

" Ctrl P
let g:ctrlp_map = '<c-f>'
let g:ctrlp_cmd = 'CtrlP'

" Automatically use system clipboard for copy and paste
set clipboard=unnamedplus

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%{fugitive#statusline()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes':[],'passive_filetypes': [] }
nnoremap <C-c> :SyntasticCheck<CR>


let g:syntastic_filetype_map = {'json': 'javascript'}
let g:syntastic_javascript_checkers=['']
let g:syntastic_python_checkers=['pylint']

" Strip all trailing whitespace on save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Window navigation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitright
set splitbelow

"Remap move windows
nnoremap <C-p> <C-w>w

"Shortcuts using CTRL
"Tab shortcuts
nnoremap <C-j> :bn<cr>
nnoremap <C-k> :bp<cr>
nnoremap <C-i> :bn<cr>:bd#<cr>

" Invoke ctrl p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"Cursor wrapping, which wraps arrow keys
set whichwrap+=<,>,h,l,[,]

" Delete without yanking
nnoremap d "_d
xnoremap d "_d

"Folding stuff
au BufNewFile,BufRead *.py,*.json set foldmethod=indent
au FileType cpp set foldmethod=syntax
au FileType c set foldmethod=syntax
map <space> za
set foldnestmax=1

" move vertically by visual line
nnoremap j gj
nnoremap k gk

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vimrc Behavior
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" No backups and swaps
set nobackup
set noswapfile

"Source .vimrc once it's been edited
autocmd! bufwritepost .vimrc source ~/.vimrc

"Reload files after vimrc has been edited
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC| if has('gui_running') | so $MYGVIMRC | endif
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Send more characters for redraws
set ttyfast
" Configure vim for mouse input
set mouse=a

set t_Co=256

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax Highlighting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Max Length check
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set the maximal line length to 80 characters
function ShowLongLine()
match ErrorMsg '\%81v.\+'
endfunction

command R call ShowLongLine()
