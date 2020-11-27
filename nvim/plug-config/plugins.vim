call plug#begin('~/.local/share/nvim/plugged')

" Git
Plug 'tpope/vim-fugitive'

" Saves previous edits in file
Plug 'mbbill/undotree'

" Line at the bottom and icons
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'

" Intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Debugger
Plug 'puremourning/vimspector'

" Python Plugins
Plug 'Vimjas/vim-python-pep8-indent'

" Pydocstring plugins
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }

" Tools to make life easier
Plug 'preservim/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'lilydjwg/colorizer'

" File Manager and floating window
Plug 'mcchrish/nnn.vim'
Plug 'voldikss/vim-floaterm'

" Fuzzy finder
Plug 'junegunn/fzf.vim'

" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'wadackel/vim-dogrun'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'ayu-theme/ayu-vim'

call plug#end()

" Unmap pydocstring from <C-l>
nmap <silent> <C-_> <Plug>(pydocstring)

" Vimspector Keymaps
let g:vimspector_enable_mappings = 'HUMAN'
"packadd! vimspector

"let g:gruvbox_italic=1
"let g:gruvbox_contrast_dark='hard'
"colorscheme gruvbox
"colorscheme dogrun
"colorscheme challenger_deep
let ayucolor="mirage"
colorscheme ayu

"hi Normal guibg=NONE ctermbg=NONE

if executable('Rg')
    let g:rg_derive_root='true'
endif

let g:lightline = {
			\ 'colorscheme': 'ayu_dark',
			\ 'active': {
			\ 'left': [ [ 'mode', 'paste' ], [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
			\},
			\ 'component_function': { 'gitbranch': 'FugitiveHead' },
			\}

autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

autocmd FileType tex :setlocal spell spelllang=en_us
autocmd FileType tex map <silent> <F5> :!pdflatex %<CR>

autocmd FileType markdown :setlocal spell spelllang=en_us
autocmd FileType markdown map <silent> <F5> :!pandoc -f markdown % -Tpdf -C -o %:r.pdf<CR>

autocmd FileType rmd :setlocal spell spelllang=en_us
autocmd FileType rmd map <silent> <F5> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>

autocmd FileType ms :setlocal spell spelllang=en_us
autocmd FileType ms map <silent> <F5> :!groff -ms % -Tpdf > %:r.pdf

autocmd FileType cpp map <F1> :!g++ -Wall -O2 % -o %:r<CR>
autocmd FileType cpp map <F2> :!%:r<CR>

autocmd FileType go map <F1> :!go run %<CR>
