" Set compatibility to Vim only.
set nocompatible

" Helps force plug-ins to load correctly when it is turned back on below.
filetype off

" Turn on syntax highlighting.
syntax on

" For plug-ins to load correctly.
filetype plugin indent on

" Set colorscheme
:silent! colorscheme codedark

" Turn off modelines
" set modelines=1

" Automatically wrap text that extends beyond the screen length.
set wrap

" Uncomment below to set the max textwidth. Use a value corresponding to the width of your screen.
" set formatoptions=tcqrn1
" set textwidth=80

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

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>,(:),{:},[:]

" Display different types of white spaces.
" set list
" set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Show line numbers
set number

" Show relative line numbers
set relativenumber

" Highlight current line
set cursorline

" Set status line display
set statusline=%f%m%r%h%w%=%{&fileformat}\ %y\ [%l,%v]\ %l\/\%L\ [%p%%]

" Set encoding
set encoding=utf-8

" Highlight matching search patterns
set hlsearch

" Enable incremental search
set incsearch

" Include matching uppercase words with lowercase search term
set ignorecase

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

function! g:CustomFileTypeSpecificOps(filetype)
    if (a:filetype == 'go')
        set noexpandtab
        set tabstop=8
        set softtabstop=8
        set shiftwidth=8
    elseif (a:filetype == 'yaml')
        set noexpandtab
        set tabstop=2
        set softtabstop=2
        set shiftwidth=2
    elseif (a:filetype == 'make')
        set noexpandtab
    endif
endfunction

" Auto commands
autocmd FileType * call CustomFileTypeSpecificOps(&filetype)
