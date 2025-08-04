-- vim default file browser plugin nil=activate, 1=deactivate
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true -- set termguicolors to enable highlight groups

vim.opt.relativenumber = true -- show relative line numbers
vim.opt.number = true -- shows absolute line number on cursor line (when relative number is on)

vim.opt.mouse = '' -- set mouse mode 'a' for activate

vim.opt.undofile = true -- save undo history

vim.opt.tabstop = 4 -- 4 spaces for tabs
vim.opt.shiftwidth = 4 -- 4 spaces for indent width
vim.opt.expandtab = true -- expand tab to spaces
vim.opt.autoindent = true -- copy indent from current line when starting new one

vim.opt.wrap = false -- disable line wrapping

-- search settings
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true -- if mixed case in search, assumes you want case-sensitive

-- cursor line
vim.opt.cursorline = true -- highlight the current cursor line


-- clipboard
vim.opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
vim.opt.splitright = true -- split vertical window to the right
vim.opt.splitbelow = true -- split horizontal window to the bottom

vim.opt.iskeyword:append("-") -- consider string-string as whole word

vim.opt.scrolloff = 10 -- minimal number of lines to keep above and below the cursor

vim.opt.signcolumn = 'yes' -- keep signcolumn on by default

vim.g.r_indent_align_args = 0 -- indentation for R Programming Language

vim.opt.colorcolumn = "100"

-- allow backspace on indent, end of line or insert mode start position
-- vim.opt.backspace = "indent,eol,start"

-- disable intro message
vim.opt.shortmess:append("I")

vim.cmd("colorscheme genyii")
