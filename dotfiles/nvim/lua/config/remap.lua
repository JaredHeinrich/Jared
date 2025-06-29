vim.g.mapleader = " "
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("n", "tj", ":bnext<enter>")
vim.keymap.set("n", "tk", ":bprev<enter>")
vim.keymap.set("n", "th", ":bfirst<enter>")
vim.keymap.set("n", "tl", ":blast<enter>")
vim.keymap.set("n", "td", ":bdelete<enter>")
vim.keymap.set('n', 'E', vim.diagnostic.open_float)
