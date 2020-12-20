" Window Movement
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" File Manager
"nnoremap <leader>e :Vifm<CR>

" nnn
nnoremap <leader>nn :FloatermNew nnn<CR>

" Fuzzy finder
nnoremap <C-p> :Files<CR>
nnoremap <C-b> :Buffers<CR>


" Buffer movement
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>bd :bd<CR>

" Tabs
nnoremap <leader>to :tabnew<CR>

" Undo Tree
nnoremap <leader>u :UndotreeToggle<CR>

" Rip grep
nnoremap <Leader>/ :Rg<CR>

" Window Resize
nnoremap <C-h> :vertical resize +5<CR>
nnoremap <C-l> :vertical resize -5<CR>
nnoremap <C-j> :resize -2<CR>
nnoremap <C-k> :resize +2<CR>

" Terminal Keymaps Messes with floaterm
"tnoremap <Esc> <C-\><C-n>

" Remap Escape Key
inoremap jk <Esc>

"" python PUDB
"nnoremap <leader>bb :TogglePudbBreakPoint<CR>

" Vimspector
nnoremap <leader>dd :call vimspector#Launch()<CR>

" Unmap pydocstring from <C-l>
nmap <silent> <C-_> <Plug>(pydocstring)

map <C-c> <plug>NERDCommenterInvert

