vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.smartindent = true
vim.o.nu = true
vim.o.rnu = true
vim.o.undodir = os.getenv("HOME") .. "/.local/share/nvim/undodir"
vim.o.undofile = true
vim.o.incsearch = true
vim.o.laststatus = 3
vim.o.ruler = true
vim.o.cursorline = true
vim.o.showtabline = 2
vim.o.clipboard = "unnamed,unnamedplus"
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.mouse = "a"
vim.o.termguicolors = true
vim.o.scrolloff = 3
vim.o.completeopt = "menu,menuone,noselect,popup"
vim.o.updatetime = 100
vim.o.fileformats = "unix,dos"
vim.o.wrap = false
-- vim.o.winbar="%m\ %%f"
vim.o.hlsearch = false
vim.o.errorbells = false
vim.o.swapfile = false
vim.o.backup = false
vim.o.colorcolumn = "80,120"
-- vim.o.formatoptions-=cro
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

vim.o.tabline = '%!v:lua.MyTabLine()'

function _G.MyTabLine()
  local s = ''
  for i = 1, vim.fn.tabpagenr('$') do
    -- Select highlighting
    if i == vim.fn.tabpagenr() then
      s = s .. '%#TabLineSel#'
    else
      s = s .. '%#TabLine#'
    end

    -- Set the tab page number
    s = s .. '%' .. i .. 'T'

    -- Get buffer name and make it relative to cwd
    local buflist = vim.fn.tabpagebuflist(i)
    local winnr = vim.fn.tabpagewinnr(i)
    local bufnr = buflist[winnr]
    local bufname = vim.fn.bufname(bufnr)
    local filename = vim.fn.fnamemodify(bufname, ':~:.')

    if filename == '' then
      filename = '[No Name]'
    end

    -- Add modified flag
    local modified = vim.fn.getbufvar(bufnr, '&modified') == 1 and ' [+]' or ''

    s = s .. ' ' .. filename .. modified .. ' '
  end

  s = s .. '%#TabLineFill#%T'
  return s
end
