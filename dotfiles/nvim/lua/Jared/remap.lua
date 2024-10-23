vim.g.mapleader = " "
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("n", "tk", ":bnext<enter>")
vim.keymap.set("n", "tj", ":bprev<enter>")
vim.keymap.set("n", "th", ":bfirst<enter>")
vim.keymap.set("n", "tl", ":blast<enter>")
vim.keymap.set("n", "td", ":bdelete<enter>")
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
