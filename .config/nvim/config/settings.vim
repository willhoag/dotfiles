set nocompatible

syntax enable

set number
set cursorline
set showcmd
set noshowmode
set textwidth=80
set ignorecase
set nohlsearch
set nowrap
set splitright
set splitbelow
set conceallevel=0

set updatetime=100 " Do things when I stop typing for three-quarters of a second
set notimeout " Don't time out partially entered mapped key sequences
set ttimeout " But do time out key codes

" set colorcolumn=+1 " show code length line

" Allow the cursor to get to the top or bottom of the screen before scrolling
" vertically, but set a reasonably wide gutter for scrolling horizontally; no
" particular reason, just suits me better
set scrolloff=0
set sidescrolloff=8
set sidescroll=1

" conde folding
set foldmethod=manual   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

set autoread " keeps buffers in sync with file changes

" Adopt the indent of the last line on new lines; interestingly, plugins that
" do clever things with indenting will often assume this is set
set autoindent

set expandtab " Use spaces instead of tabs
set shiftwidth=4 " Indent with four spaces when an indent operation is used
set softtabstop=4 " Insert four spaces when Tab is pressed
set tabstop=4 " How many spaces to show for a literal tab when 'list' is unset

" Indent intelligently to 'shiftwidth' at the starts of lines with Tab, but
" use 'tabstop' everywhere else
set smarttab

" When indenting lines with < or >, round the indent to a multiple of
" 'shiftwidth', so even if the line is indented by one space it will indent
" up to 4 and down to 0, for example
set shiftround

" setup swp folder + persistent backups and undos
set backup " keep a backup file (restore to previous version)
set undofile " keep an undo file (undo changes after closing)
set undodir=~/.config/nvim/.undo//
set backupdir=~/.config/nvim/.backup//
set directory=~/.config/nvim/.swp//

set history=2000 " Keep plenty of command and search history, because disk space is cheap
set undolevels=2000 " Keep screeds of undo history
set shortmess+=I " Don't show the Vim startup message

" files
filetype indent plugin on " load custom file specific settings
set path+=** " Search down into subfolders
set wildignore+=*/node_modules/*
set wildignore+=.DS_Store
set wildmenu " Display all matching files when we tab complete

if executable('ack')
  set grepprg=ack\ -s\ -H\ --nogroup\ --nocolor\ --nocolumn
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   execute "normal! g`\"" |
  \ endif

" Auto close preview window
autocmd InsertLeave * if bufname('%') != "[Command Line]" | pclose | endif

" cursor change on insert mode
" Note: doesn't work in osx-terminal
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1


