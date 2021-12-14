call plug#begin('~/.local/share/nvim/plugged')

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Saves previous edits in file
Plug 'mbbill/undotree'

" Line at the bottom and icons
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" LSP and Completion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" Autopair
Plug 'windwp/nvim-autopairs'

" Python Plugins
Plug 'Vimjas/vim-python-pep8-indent'
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

" Bitbake
Plug 'kergoth/vim-bitbake'

" Fuzzy finder
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Change surrounding barckets, quotes, etc...
Plug 'tpope/vim-surround'

Plug 'akinsho/toggleterm.nvim'
Plug 'kyazdani42/nvim-tree.lua'

" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'ghifarit53/tokyonight-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'wadackel/vim-dogrun'
Plug 'sainnhe/everforest'

call plug#end()

"let g:gruvbox_italic=1
"let g:gruvbox_contrast_dark='hard'
"colorscheme gruvbox

"let g:tokyonight_style = 'night' " available: night, storm
"let g:tokyonight_enable_italic = 1
"colorscheme tokyonight

"colorscheme nord

"colorscheme dogrun

colorscheme everforest

"if exists('+termguicolors')
        "let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        "let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"endif

if executable('Rg')
    let g:rg_derive_root='true'
endif
