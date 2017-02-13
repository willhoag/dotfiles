" netrw preview vertically split to the right
let g:netrw_preview=1
let g:netrw_alto=0

" netrw default to tree view
let g:netrw_liststyle = 3

" netrw default percentage width
let g:netrw_winsize = 25

" hide files in netrw
let g:netrw_list_hide ='.DS_Store,.*\.swp$,.*\.pyc'

" TODO -- Fix to work
" Make auto-close preview one BufUnload
" autocmd! FileType netrw autocmd! BufUnload <buffer> pc

" turn on omnicomplete
let g:deoplete#enable_at_startup = 1

" Use tern_for_vim.
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" multiple cursors
hi multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
hi link multiple_cursors_visual Visual
let g:multi_cursor_exit_from_visual_mode=0
let g:multi_cursor_exit_from_insert_mode=0

" make command to toggle corsorword
" TODO -- are my variables scoped correctly?
command! ToggleCursorWordBuffer :call CursorWordToggle('b:')
command! ToggleCursorWord :call CursorWordToggle('g:')
function! CursorWordToggle(list)
  execute 'let scope = ' . a:list
  let expression = a:list . 'cursorword=' . !get(scope, 'cursorword', 1)
  execute 'let ' . expression
  echom expression
endfunction

let g:EasyMotion_smartcase = 1 " Turn on case insensitive feature

" kill repeating hjkl motions to practice more advanced motions
" let g:hardtime_default_on = 1

" Indention Guides
let g:indentLine_color_term = 239

" Neomake
let g:neomake_javascript_enabled_makers = ['standard']
autocmd! BufWritePost * Neomake " run neomake on save

" Strip whitespace on save
autocmd BufWritePre * StripWhitespace

" Activation based on file type
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END

" Default sort by order for tagbar
let g:tagbar_sort = 0

" ignore folders for ctrlp
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

" don't conceal characters in markdown
let g:markdown_syntax_conceal = 0

" disable remapping in netrw
let g:pasta_disabled_filetypes = ['-']

" hide in netrw
" TODO -- This is getting overwritten by a plugin somewhere
let g:netrw_list_hide = '.*\.swp$,\.DS_Store$,*\.so$,*\.swp$,*\.zip$,*\.git$'
