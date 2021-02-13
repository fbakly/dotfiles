call plug#begin('~/.local/share/nvim/plugged')

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
set updatetime=100 " set update time for gitgutter update

" Saves previous edits in file
Plug 'mbbill/undotree'

" Line at the bottom and icons
Plug 'itchyny/lightline.vim'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

" Autopair
Plug 'windwp/nvim-autopairs'

" Python Plugins
Plug 'Vimjas/vim-python-pep8-indent'

" Pydocstring plugins
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }

" Tools to make life easier
Plug 'preservim/nerdcommenter'
Plug 'lilydjwg/colorizer'

" File Manager and floating window
Plug 'mcchrish/nnn.vim'
Plug 'voldikss/vim-floaterm'

" Improved motion
Plug 'psliwka/vim-smoothie'
Plug 'easymotion/vim-easymotion'

" Fuzzy finder
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Change surrounding barckets, quotes, etc...
Plug 'tpope/vim-surround'

" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'ghifarit53/tokyonight-vim'
Plug 'arcticicestudio/nord-vim'

call plug#end()

"let g:gruvbox_italic=1
"let g:gruvbox_contrast_dark='hard'
"colorscheme gruvbox

"let g:tokyonight_style = 'night' " available: night, storm
"let g:tokyonight_enable_italic = 1
"colorscheme tokyonight

colorscheme nord
set background=dark

if exists('+termguicolors')
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
set completeopt=menuone,noinsert,noselect

lua << EOF
require('nvim-autopairs').setup()

-- this is my mapping with completion-nvim
local remap = vim.api.nvim_set_keymap
local npairs = require('nvim-autopairs')

-- skip it, if you use another global object
_G.MUtils= {}

vim.g.completion_confirm_key = ""

MUtils.completion_confirm=function()
  if vim.fn.pumvisible() ~= 0  then
    if vim.fn.complete_info()["selected"] ~= -1 then
      require'completion'.confirmCompletion()
      return npairs.esc("<c-y>")
    else
      vim.fn.nvim_select_popupmenu_item(0 , false , false ,{})
      require'completion'.confirmCompletion()
      return npairs.esc("<c-n><c-y>")
    end
  else
    return npairs.check_break_line_char()
  end
end

remap('i' , '<CR>','v:lua.MUtils.completion_confirm()', {expr = true , noremap = true})

require'lspconfig'.sumneko_lua.setup{
	cmd = {"/usr/bin/lua-language-server"},
	on_attach = require'completion'.on_attach
}
require'lspconfig'.pyright.setup{ 
	on_attach = require'completion'.on_attach 
}
require'lspconfig'.gopls.setup{
	on_attach=require'completion'.on_attach 
}
require'lspconfig'.clangd.setup{
	on_attach=require'completion'.on_attach 
}
require'lspconfig'.texlab.setup{
	on_attach=require'completion'.on_attach 
}
EOF

if executable('Rg')
    let g:rg_derive_root='true'
endif

let g:lightline = {
			\ 'colorscheme': 'nord',
			\ 'active': {
			\ 'left': [ [ 'mode', 'paste' ], [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
			\},
			\ 'component_function': { 'gitbranch': 'FugitiveHead' },
			\}

autocmd FileType tex :setlocal spell spelllang=en_us
autocmd FileType tex map <silent> <F5> :!pdflatex %<CR>
autocmd FileType tex map <silent> <F1> :!pdflatex % ; bibtex %:r ; makeindex -s %:r.ist -t %:r.glg -o %:r.gls %:r.glo; pdflatex %<CR>

autocmd FileType markdown :setlocal spell spelllang=en_us
autocmd FileType markdown map <silent> <F5> :!pandoc -f markdown % -Tpdf -C -o %:r.pdf<CR>

autocmd FileType rmd :setlocal spell spelllang=en_us
autocmd FileType rmd map <silent> <F5> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>

autocmd FileType ms :setlocal spell spelllang=en_us
autocmd FileType ms map <silent> <F5> :!groff -ms % -Tpdf > %:r.pdf

autocmd FileType cpp map <F1> :!g++ -Wall -O2 % -o %:r<CR>
autocmd FileType cpp map <F2> :!./%:r<CR>

autocmd FileType go map <F1> :!go run %<CR>
autocmd FileType go map <F2> :!go run %

autocmd FileType python map <F1> :!python %<CR>
autocmd FileType python map <F2> :!python %
