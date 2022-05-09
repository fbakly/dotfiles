let mapleader = " "

syntax on                                               " Enable Syntax Highlighting
set ignorecase
set nohlsearch
set smartcase
set nocompatible                                        " Not sure but fixed my pasting issue
set noerrorbells                                        " Disable annoying bells
set tabstop=4 softtabstop=0 noexpandtab shiftwidth=4    " Set hard tab of size 4
set smartindent                                         " Nice indentation
set nu rnu                                              " Hybrid line numbers
set nowrap                                              " Doesn't break line when too long
set noswapfile                                          " Disable unwanted swap file
set nobackup                                            " Disable unwanted backup files
set undodir=~/.config/nvim/undodir                      " Needed by undotree
set undofile                                            " Needed by undotree
set incsearch                                           " Search while typing the string
set laststatus=2                                        " Always show status line
set colorcolumn=80                                      " Set column at char 80
set ruler                                               " Always show cursor position
set cursorline                                          " Highlight line cursor is on
set showtabline=2 										" set tabline to show
set switchbuf=usetab,newtab 							" 
set clipboard+=unnamedplus 								" Copy paste between vim and everything else
set splitbelow 											" Horizontal split always open below"
set splitright 											" Vertical Split always opens right
set mouse=a 											" Enable mouse
set hidden
set formatoptions-=cro
set termguicolors
set scrolloff=5
set completeopt=menu,menuone,noselect
set updatetime=100 " set update time for gitgutter update
set fileformats=unix,dos

highlight ColorColumn ctermbg=0 guibg=lightgrey

filetype plugin on 										" Reqired by VimWiki on by default on neovim

packadd termdebug 										" Adding terminal debugger
