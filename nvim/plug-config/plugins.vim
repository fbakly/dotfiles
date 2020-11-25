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
Plug 'tell-k/vim-autopep8'

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

" VimWiki
Plug 'vimwiki/vimwiki'

" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'wadackel/vim-dogrun'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'ayu-theme/ayu-vim'

call plug#end()

" Autopep8 on save
let g:autopep8_on_save=1
let g_autopep8_ignore="E114,E115,E116"
" Autopep8 disable diff
let g:autopep8_disable_show_diff=1

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
