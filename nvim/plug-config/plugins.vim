call plug#begin('~/.local/share/nvim/plugged')

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
set updatetime=100 " set update time for gitgutter update

" Saves previous edits in file
Plug 'mbbill/undotree'

" Line at the bottom and icons
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'

" Intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Autopair
Plug 'jiangmiao/auto-pairs'

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
Plug 'junegunn/fzf.vim'

" Change surrounding barckets, quotes, etc...
Plug 'tpope/vim-surround'

" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'wadackel/vim-dogrun'
Plug 'ajh17/Spacegray.vim'
Plug 'ghifarit53/tokyonight-vim'

call plug#end()

"let g:gruvbox_italic=1
"let g:gruvbox_contrast_dark='hard'
"colorscheme gruvbox

"colorscheme dogrun

"colorscheme challenger_deep

"let ayucolor="dark"
"colorscheme ayu

"let g:spacegray_use_italics=1
"colorscheme spacegray

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
colorscheme tokyonight

if executable('Rg')
    let g:rg_derive_root='true'
endif

let g:lightline = {
			\ 'colorscheme': 'tokyonight',
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
autocmd FileType cpp map <F2> :!./%:r<CR>

autocmd FileType go map <F1> :!go run %<CR>
autocmd FileType go map <F2> :!go run %

autocmd FileType python map <F1> :!python %<CR>
autocmd FileType python map <F2> :!python %
