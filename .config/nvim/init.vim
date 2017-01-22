" Global dependencies
" npm: jsctags, tern
" brew: universal-ctags

" FIXME -- to work with vim modeline so this can be specific to this file
" vim:fdm=marker
" vim: set foldmarker={,} foldlevel=0 foldmethod=marker tabstop=2 shiftwidth=2 softtabstop=2

set shell=/bin/sh

" Autoreload vimrc and config files on save
autocmd! BufWritePost $MYVIMRC,{~/.config/nvim/,}{config,}/*.vim nested source $MYVIMRC

" Automatic Plug installation
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin()

" UI
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/goyo.vim'
Plug 'mbbill/undotree'
Plug 'mikewest/vimroom'
Plug 'troydm/zoomwintab.vim'
Plug 'majutsushi/tagbar'
Plug 'jreybert/vimagit'
Plug 'KabbAmine/vCoolor.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-vinegar'
Plug 'EinfachToll/DidYouMean'
Plug 'kassio/neoterm'

" Configuration
Plug 'airblade/vim-rooter'

" commands
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'duggiefresh/vim-easydir'
Plug 'phongvcao/vim-stardict'

" completions
Plug 'Shougo/deoplete.nvim'
Plug 'carlitux/deoplete-ternjs'

" FIXME -- Doesn't integrate with deoplete
Plug 'othree/jspc.vim', { 'for': 'javascript' }

" snippets
Plug 'mattn/emmet-vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'chip/vim-fat-finger'
Plug 'ervandew/supertab'
Plug 'othree/html5.vim', { 'for': 'html' }
Plug '1995eaton/vim-better-javascript-completion'
Plug 'ahmedelgabri/vim-ava-snippets'

" motions
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'takac/vim-hardtime'
Plug 'easymotion/vim-easymotion'
Plug 'tommcdo/vim-exchange'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'AndrewRadev/sideways.vim'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/undofile_warn.vim'
Plug 'junegunn/vim-easy-align'
Plug 'jeetsukumaran/vim-indentwise'

" objects
Plug 'wellle/targets.vim'
Plug 'michaeljsmith/vim-indent-object'

" languages
Plug 'sheerun/vim-polyglot'
Plug 'isRuslan/vim-es6'
Plug 'moll/vim-node'

" Syntax
Plug 'benekastah/neomake'
Plug 'Chiel92/vim-autoformat'
Plug 'gorodinskiy/vim-coloresque'
Plug 'ntpeters/vim-better-whitespace'
Plug 'neovim/node-host'
Plug 'itchyny/vim-cursorword'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/rainbow_parentheses.vim', {'for': 'clojure'}
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-sleuth'
Plug 'timakro/vim-searchant'

" themes
Plug 'crusoexia/vim-monokai'

call plug#end()

" load config settings
runtime! config/*.vim

