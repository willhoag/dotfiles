let mapleader = ','

" Add right bracket to esc for ergodox keyboard layout
inoremap <C-]> <esc>
vnoremap <C-]> <esc>

" Next and prev buffers
nmap gn :bn<cr>
nmap gp :bp<cr>

" Open netrw in current window
nmap <leader>ft :Ntree<CR>

" Open config folder for nvim
nnoremap <leader>c :e ~/.config/nvim<CR>

" add whole file as a target object
onoremap af :<C-u>normal! ggVG<CR>

" remap for smarter command history with matching
cnoremap <c-n> <down>
cnoremap <c-p> <up>

" swap mappings so it's easier to jump to last column + row
nnoremap '' ``
nnoremap `` ''

" keep selection when indenting
xnoremap < <gv
xnoremap > >gv
"
" When wrapping, j and k should move by screen row, and not to the same
" column number in the previous logical line, which feels very clumsy and is
" seldom particularly helpful; you can use n| to jump to the nth column in a
" line anyway if you need to
nnoremap j gj
nnoremap k gk

" Search and replace shortcut. Type S search/replace <CR>
" Replace shortcut. Type M replace <CR>
nmap S :%s//g<LEFT><LEFT>
nmap <expr> M ':%s/' . @/ . '//g<LEFT><LEFT>'

" hotkey for new tab
nnoremap <silent> <C-t>n :tabnew<CR>
nnoremap <C-t>h :tabprevious<CR>
nnoremap <C-t>l :tabnext<CR>


" Rebind Ctrl-C in insert mode to not only leave insert mode without firing
" InsertLeave events, but also to actually undo the current insert operation
inoremap <C-c> <C-c>u

" Don't jump my screen around when I join lines, keep my cursor in the same
" place; this is done by dropping a mark first and then immediately returning
" to it; note that it wipes out your z mark, if you happen to use it
nnoremap J mzJ`z

" Change and delete with C and D both cut off the remainder of the line from
" the cursor, but Y yanks the whole line, which is inconsistent (and can be
" done with yy anyway); this fixes it so it only yanks the rest of the line
noremap Y y$

" Copy and paste with the system register using leader + same commands
map <leader>y "*y
nmap <leader>yy "*yy
map <leader>Y "*Y
map <leader>p "*p

" Add blank lines above and below without going into insert mode
nmap go o<esc>
nmap gO O<esc>

" Move current line / visual line selection up or down.
" nnoremap <c-k> :m-2<CR>==
" nnoremap <c-j> :m+<CR>==
" vnoremap <c-j> :m'>+<CR>gv=gv
" vnoremap <c-k> :m-2<CR>gv=gv

" Shortcuts to quickly switch to common file types; handy when using
" editing abstractions like sudoedit(8)
nnoremap _ap :setlocal filetype=apache<CR>
nnoremap _bi :setlocal filetype=bindzone<CR>
nnoremap _cl :setlocal filetype=clojure<CR>
nnoremap _cs :setlocal filetype=css<CR>
nnoremap _ht :setlocal filetype=html<CR>
nnoremap _js :setlocal filetype=javascript<CR>
nnoremap _md :setlocal filetype=markdown<CR>
nnoremap _pl :setlocal filetype=perl<CR>
nnoremap _ph :setlocal filetype=php<CR>
nnoremap _py :setlocal filetype=python<CR>
nnoremap _rb :setlocal filetype=ruby<CR>
nnoremap _sh :setlocal filetype=sh<CR>
nnoremap _vi :setlocal filetype=vim<CR>
nnoremap _xm :setlocal filetype=xml<CR>

" Expands to the directory of current file.
cnoremap %% <C-R>=expand("%:h")."/"<CR>

" Uses alt command if first command doesn't change the cursor position
function! ToggleMovement(firstOp, thenOp)
  let pos = getpos('.')
  execute "normal! " . a:firstOp
  if pos == getpos('.')
    execute "normal! " . a:thenOp
  endif
endfunction

" The original carat 0 swap
nnoremap <silent> 0 :call ToggleMovement('^', '0')<CR>

" How about H and L
" nnoremap <silent> H :call ToggleMovement('H', 'L')<CR>
" nnoremap <silent> L :call ToggleMovement('L', 'H')<CR>

" How about G and gg
nnoremap <silent> G :call ToggleMovement('G', 'gg')<CR>
nnoremap <silent> gg :call ToggleMovement('gg', 'G')<CR>
