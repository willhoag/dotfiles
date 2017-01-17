colorscheme monokai

" syntax
hi Comment ctermfg=240
hi MatchParen ctermfg=197 ctermbg=NONE cterm=underline guifg=#f92672 guibg=NONE gui=underline

" UI
hi LineNr ctermfg=237
hi CursorLineNr ctermfg=245
hi CursorLine ctermbg=NONE

" highlight overlength text
match Error /\%81v.\+/

