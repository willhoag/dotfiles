" Global dependencies
" npm: jsctags
" brew: universal-ctags

" FIXME -- to work with vim modeline so this can be specific to this file
" vim:fdm=marker
" vim: set foldmarker={,} foldlevel=0 foldmethod=marker tabstop=2 shiftwidth=2 softtabstop=2

" set shell=/bin/sh

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
Plug 'mbbill/undotree'
Plug 'troydm/zoomwintab.vim'
Plug 'majutsushi/tagbar', { 'do': 'npm i -g jsctags' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-vinegar'
Plug 'airblade/vim-gitgutter'
Plug 'jreybert/vimagit'
Plug 'kassio/neoterm'
Plug 'junegunn/goyo.vim'
Plug 'mikewest/vimroom'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'EinfachToll/DidYouMean'
Plug 'KabbAmine/vCoolor.vim'
Plug 'chrisbra/NrrwRgn'

" Configuration
Plug 'airblade/vim-rooter'

" Commands
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'duggiefresh/vim-easydir'
Plug 'phongvcao/vim-stardict'
Plug 'ternjs/tern_for_vim'
Plug 'rhlobo/vim-super-retab'
Plug 'janko-m/vim-test'

" Snippets and Completions
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm i -g tern' }
Plug 'othree/jspc.vim', { 'for': 'javascript' } " FIXME -- Doesn't integrate with deoplete
Plug 'wokalski/autocomplete-flow'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'mattn/emmet-vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
Plug 'othree/html5.vim', { 'for': 'html' }
Plug '1995eaton/vim-better-javascript-completion'
Plug 'ahmedelgabri/vim-ava-snippets'

" Motions
Plug 'tpope/vim-unimpaired'
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
Plug 'vim-scripts/undofile_warn.vim'
Plug 'junegunn/vim-easy-align'
Plug 'jeetsukumaran/vim-indentwise'

" Objects
Plug 'wellle/targets.vim'
Plug 'michaeljsmith/vim-indent-object'

" Languages
Plug 'sheerun/vim-polyglot'
Plug 'moll/vim-node'
Plug 'elixir-lang/vim-elixir'

" Syntax
Plug 'benekastah/neomake'
Plug 'gorodinskiy/vim-coloresque'
Plug 'ntpeters/vim-better-whitespace'
Plug 'neovim/node-host'
Plug 'itchyny/vim-cursorword'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/rainbow_parentheses.vim' ", {'for': 'clojure'}
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-sleuth'
Plug 'timakro/vim-searchant'
Plug 'sbdchd/neoformat', { 'do': 'npm i -g js-beautify prettier prettier-standard' }

" themes
Plug 'crusoexia/vim-monokai'

call plug#end()

" load config settings
runtime! config/*.vim

