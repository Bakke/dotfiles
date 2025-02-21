" Relaod .vimrc
nmap <silent> <leader>r :so $MYVIMRC<CR>

" Pretty json
map <leader>p :PlugUpdate<CR>

" Clear last search
nmap <silent> <leader>c :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

" Copy to clipboard
vnoremap <silent> <C-c> "+y

if &wildoptions =~ "pum"
    cnoremap <expr> <C-k> pumvisible() ? "<C-p>" : "\\<C-k>"
    cnoremap <expr> <C-j> pumvisible() ? "<C-n>" : "\\<C-j>"
endif

" Mappings for git
map <silent> <leader>gs :Git<CR>
" map <silent> <leader>gd :Gvdiffsplit<CR>
map <silent> <leader>gp :Git push<CR>
map <silent> <leader>gpf :Git push --force<CR>
map <silent> <leader>gl :Git pull<CR>
map <silent> <leader>gh :Git log %<CR>
map <silent> <leader>gg :Git log --oneline<CR>
" map <silent> <leader>gh :Git log --graph --pretty=oneline --abbrev-commit %<CR>
map <silent> <leader>gb :Git blame<CR>

"fix search - normal regex can be used in searching
nnoremap / /\v
vnoremap / /\v

" Search for selected text or text under cursor (normal mode)
vnoremap // y/\V<C-R>"<CR>N
nnoremap // viwy/\V<C-R>"<CR>N

nnoremap <M-/> viwy:Rg <C-R>"<CR>/\V<C-R>"<CR>

nnoremap /" \"\zs(\s)@![^\"]+(\s)@<!\ze\"<CR>N
nnoremap /' \'\zs(\s)@![^\']+(\s)@<!\ze\'<CR>N

" Use jj for esc
inoremap <silent> jj <esc>

" Use gb to select last pasted text
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'

" Better split switching (Ctrl-j, Ctrl-k, Ctrl-h, Ctrl-l)
" noremap <C-j> <C-W>j
" noremap <C-k> <C-W>k
" noremap <C-h> <C-W>h
" noremap <C-l> <C-W>l

" Close buffers
nnoremap <silent> <C-q>     :bd!<CR>
nnoremap <silent> <C-w>     :bd<CR>
inoremap <silent> <C-q>     <Esc>:bd!<CR>
inoremap <silent> <C-w>     <Esc>:bd<CR>

" Next/previous buffer with Shift + H/L
nmap H :bprevious<CR>
nmap L :bnext<CR>

" Indention
nnoremap ø <<
nnoremap æ >>
vnoremap ø <
vnoremap æ >

" Better mark jumping (line + col)
nnoremap ' `

" Pretty json
map <leader>j :%!python3 -m json.tool<CR>

" Insert UUID
nnoremap <leader>u :py import uuid, vim; vim.command(':normal a' + str(uuid.uuid1()))<cr>
inoremap <leader>u <esc>:py import uuid, vim; vim.command(':normal a' + str(uuid.uuid1()))<cr>a

" Disable arrow movement, resize splits instead.
nnoremap <M-Up>    :resize +2<CR>
nnoremap <M-Down>  :resize -2<CR>
nnoremap <M-Left>  :vertical resize +2<CR>
nnoremap <M-Right> :vertical resize -2<CR>

" Repeat macro over visually selected range
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
    echo "@".getcmdline()
    execute ":'<,'>normal @".nr2char(getchar())
endfunction
