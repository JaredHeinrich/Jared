vim.g.mapleader = " "
vim.keymap.set("i", "<C-l>", "<Esc>", {desc = "Exit Insert Mode"})
vim.keymap.set("v", "<C-l>", "<Esc>", {desc = "Exit Insert Mode"})
vim.keymap.set("n", "td", ":bdelete<enter>", {desc = "[D]elete current Buffer"})
vim.keymap.set("n", "tj", ":bnext<enter>", {desc = "Switch to next Buffer"})
vim.keymap.set("n", "tk", ":bprev<enter>", {desc = "Switch to previous Buffer"})
vim.keymap.set('n', 'E', vim.diagnostic.open_float, {desc = "Open Diagnostic in Float"})
vim.keymap.set('n', '<leader>cs', ':nohlsearch<CR>', {
    desc = "[C]lear [S]earch Highlights",
    silent = true
})
vim.keymap.set("c", "<C-j>", "<C-n>", {desc = "Commands select next"})
vim.keymap.set("c", "<C-k>", "<C-p>", {desc = "Commands select previous"})
