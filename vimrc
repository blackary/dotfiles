" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
filetype off
call pathogen#infect() "Allow for pathogen plugins
filetype plugin indent on

set nocompatible "Doesn't have to be compatible with vi

set modelines=0 "Disables modelines

set expandtab "Turns <TAB> into spaces
set smarttab "Use tabs for indentation and spaces for alignment
set shiftwidth=4 "Affects what happens when you press >>, etc.
set tabstop=4 "Changes the width of the <TAB> character
set softtabstop=4 "Somehow different from tabstop...?
set autoindent "Copy indentation from previous line when going to next line
set colorcolumn=80 "Creates a colored line showing where 80 characters is
set fileformat=unix "Saves files in unix format by default

func! DeleteTrailingWS() "Deletes trailing whitespace
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS() "Delete whitespace in py files

set encoding=utf-8
set scrolloff=3 "Leaves 3 lines visisble when scrolling to top or bottom of page
set showmode "Shows if 'Visual' line is on
set showcmd "Shows current command going on
set nohidden "When closing buffers, they must be saved
set wildmenu "Autocomplete in command line with <TAB>
set wildmode=list:longest,full "On first tab, show all options, on second tab, scroll through options
set visualbell "Flash instead of making a 'beep' sound
set cursorline "Highlight current line
set ttyfast "Allow fast scrolling
set ruler "Display current line, column, percentage on bottom of page
set backspace=indent,eol,start "Make backspace work 'normally', i.e. going back to previous line when it should
set laststatus=2 "Always display status line
set relativenumber "Show relative line numbers on left side
set undofile "Save file that tracks edits of each file

let mapleader = "," "Make , work as leader key, instead of \

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

set wrap
set textwidth=74
set formatoptions=qrn1
set colorcolumn=80

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

nnoremap ; :

au FocusLost * :wa
autocmd BufLeave,FocusLost * silent! wall

nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <leader>a :Ack

map <leader>n :NERDTreeToggle<CR>

augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END


set foldmethod=indent

"Fold and unfold by pressing space instead of za
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR> 
vnoremap <Space> zf

"Remap capital W and Q to work the same as w and q
:command WQ wq
:command Wq wq
:command W w
:command Q q

colo peachpuff
syntax on

" Ignore files in command-t searches
set wildignore+=*.pyc
set wildignore+=*.orig
set wildignore+=~*

" Automatically show buffers sorted by most recent
nnoremap <silent> <leader>b :CommandTMRU<CR>
let g:CommandTNeverShowDotFiles=1
" Switch enter and ctrl-v to open in split by default
let g:CommandTAcceptSelectionVSplitMap = '<CR>'
let g:CommandTAcceptSelectionMap = '<C-v>'
