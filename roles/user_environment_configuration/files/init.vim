" Set compatibility to Vim only.
set nocompatible

" Helps force plug-ins to load correctly when it is turned back on below.
filetype off

" Load Plugins
call plug#begin()
" Plug 'http://github.com/pope/vim-surround' " Surrounding ysw)
Plug 'preservim/nerdtree' " NerdTree
Plug 'tpope/vim-commentary' " For Commenting gcc & gc
Plug 'vim-airline/vim-airline' " Status bar
Plug 'lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'ap/vim-css-color' " CSS Color Preview
Plug 'rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'neoclide/coc.nvim', {'branch': 'release'}  " Auto Completion
Plug 'ryanoasis/vim-devicons' " Developer Icons
Plug 'tc50cal/vim-terminal' " Vim Terminal
Plug 'preservim/tagbar' " Tagbar for code navigation
Plug 'terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'rust-lang/rust.vim'
Plug 'stephpy/vim-yaml'
Plug 'rhysd/vim-clang-format'
Plug 'cespare/vim-toml'
call plug#end()

" Plugin settings
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

" airline symbols
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ''

" Editor settings

" Turn on syntax highlighting.
syntax on

" For plug-ins to load correctly.
filetype plugin indent on

" Set colorscheme
colorscheme space-vim-dark

" Enable signcolumn by default
set signcolumn=yes

" Enable faster updates
set updatetime=250

" Turn off modelines
set modelines=1

" Automatically wrap text that extends beyond the screen length.
set wrap

" Uncomment below to set the max textwidth. Use a value corresponding to the width of your screen.
" set formatoptions=tcqrn1
" set textwidth=80
" set colorcolumn=80

" Set tab width in spaces
set tabstop=4

" Set number of characters to move when pressing tab
set shiftwidth=4

" Set soft tabstop width in spaces
set softtabstop=4

" Set this to convert tabs to spaces while typing
set expandtab

set noshiftround

" Enable mouse support
set mouse=a

" Set auto indentation on
set autoindent

" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5

" Fixes common backspace problems
set backspace=indent,eol,start

" Speed up scrolling in Vim
set ttyfast

" Status bar
set laststatus=2

" Display options
set showmode
set showcmd

" Enable lazy redraw
set lazyredraw

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>,(:),{:},[:]

" Display different types of white spaces.
set list
set listchars=trail:·,tab:➝\ ,lead:·, "eol:↵

" Show line numbers
set number

" Show relative line numbers
set relativenumber

" Highlight current line
set cursorline

" Set encoding
set encoding=utf-8

" Highlight matching search patterns
set hlsearch

" Enable incremental search
set incsearch

" Include matching uppercase words with lowercase search term
" set ignorecase

" Include only uppercase words with uppercase search term
set smartcase

" Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

" Map the <Space> key to toggle a selected fold opened/closed.
" nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
" vnoremap <Space> zf

" Automatically save and load folds
" autocmd BufWinLeave *.* mkview
" autocmd BufWinEnter *.* silent loadview

" Vim's auto indentation feature does not work properly with text copied from outside of Vim. Press the <F2> key to toggle paste mode on/off.
" nnoremap <F2> :set invpaste paste?<CR>
" imap <F2> <C-O>:set invpaste paste?<CR>
" set pastetoggle=<F2>

function! g:CustomFileTypeSpecificOps(filetype)
    if (a:filetype == 'go')
        set noexpandtab
        set tabstop=8
        set softtabstop=8
        set shiftwidth=8
    elseif (a:filetype == 'yaml')
        set tabstop=2
        set softtabstop=2
        set shiftwidth=2
        set cursorcolumn
    elseif (a:filetype == 'make')
        set noexpandtab
    elseif (a:filetype == 'python')
        set noexpandtab
    endif
endfunction

" Auto commands
autocmd FileType * call CustomFileTypeSpecificOps(&filetype)

" Always keep the search result in center
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" Add keybindings to clear trailing whitespaces
nnoremap trw :g/^\s\+$/s/^\s\+$//<CR>:g/^[\n]$/d<CR>:w<CR>

" Remap '<C-n>' to jump to normal mode when in insert mode
inoremap <C-n> <Esc>
