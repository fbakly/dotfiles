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
nnoremap <C-p>		<cmd>Telescope find_files<cr>
nnoremap <leader>/	<cmd>Telescope live_grep<cr>
nnoremap <C-b>		<cmd>Telescope buffers<cr>


" Buffer movement
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>bd :bd<CR>

" Tabs
nnoremap <leader>to :tabnew<CR>

" Undo Tree
nnoremap <leader>u :UndotreeToggle<CR>

" Window Resize
nnoremap <C-h> :vertical resize +5<CR>
nnoremap <C-l> :vertical resize -5<CR>
nnoremap <C-j> :resize -2<CR>
nnoremap <C-k> :resize +2<CR>

" Remap Escape Key
inoremap jk <Esc>

" Unmap pydocstring from <C-l>
nmap <silent> <C-_> <Plug>(pydocstring)

map <C-c> <plug>NERDCommenterInvert


" LSP
nnoremap <silent> gd 			<cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     		<cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    		<cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> 		<cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD    		<cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    		<cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    		<cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    		<cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> <c-]>    		<cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <leader>rn    <cmd>lua vim.lsp.buf.rename()<CR>

" LSP Autocomplete
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

nnoremap <C-n> :NvimTreeToggle<CR>
