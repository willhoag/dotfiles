" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

nnoremap <silent> <leader>z :Goyo<cr>

nnoremap gH :SidewaysLeft<cr>
nnoremap gL :SidewaysRight<cr>

let g:splitjoin_split_mapping = ''
let g:splitjoin_join_mapping = ''
nmap gJ :SplitjoinJoin<cr>
nmap gK :SplitjoinSplit<cr>

" Easy Motion - bi-directional find motion
nmap s <Plug>(easymotion-s)

" Jump to git changes
nmap [h <Plug>GitGutterPrevHunk
nmap ]h <Plug>GitGutterNextHunk

" Make bufexplorer split right
let g:bufExplorerSplitRight=1

" Define word under cursor (plugin implementation of :StarDictCursor is broken)
nnoremap <leader>sw :StarDict<Space>
nnoremap <leader>sc :StarDict <C-R><C-W><CR>

