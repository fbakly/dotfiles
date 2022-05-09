" Window Movement
" nnoremap <leader>h :wincmd h<CR>
" nnoremap <leader>j :wincmd j<CR>
" nnoremap <leader>k :wincmd k<CR>
" nnoremap <leader>l :wincmd l<CR>

" File Manager
"nnoremap <leader>e :Vifm<CR>

" nnn
" nnoremap <leader>nn :FloatermNew nnn<CR>

" Fuzzy finder
nnoremap <C-p>		<cmd>Telescope find_files<cr>
nnoremap <leader>/	<cmd>Telescope live_grep<cr>
nnoremap <C-b>		<cmd>Telescope buffers<cr>


" Buffer movement
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>bd :enew<bar>bd #<CR>

" Tabs
nnoremap <leader>to :tabnew<CR>
nnoremap <leader>tn :tabnext<CR>
nnoremap <leader>tp :tabprev<CR>

" Undo Tree
nnoremap <leader>u :UndotreeToggle<CR>

" Window Resize
nnoremap <C-h> :vertical resize +5<CR>
nnoremap <C-l> :vertical resize -5<CR>
" nnoremap <C-j> :resize -2<CR>
" nnoremap <C-k> :resize +2<CR>

" Remap Escape Key
inoremap jk <Esc>

" Unmap pydocstring from <C-l>
nmap <silent> <leader>pd <Plug>(pydocstring)

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
inoremap <silent> <c-k> 		<cmd>lua vim.lsp.buf.signature_help()<CR>

" Dap
nnoremap <silent> <F5> <Cmd>lua require'dap'.continue()<CR>
nnoremap <silent> <F10> <Cmd>lua require'dap'.step_over()<CR>
nnoremap <silent> <F11> <Cmd>lua require'dap'.step_into()<CR>
nnoremap <silent> <F12> <Cmd>lua require'dap'.step_out()<CR>
nnoremap <silent> <Leader>dq <Cmd>lua require"dap".terminate()<CR>
nnoremap <silent> <Leader>b <Cmd>lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <Leader>B <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <silent> <Leader>lp <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent> <Leader>dr <Cmd>lua require'dap'.repl.open()<CR>
nnoremap <silent> <Leader>dl <Cmd>lua require'dap'.run_last()<CR>

nnoremap <C-n> :NvimTreeToggle<CR>
