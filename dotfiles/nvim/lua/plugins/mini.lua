return {
    'echasnovski/mini.pick',
    version = false,
    enabled = false,
    opts = {},
    dependencies = {
        { 'echasnovski/mini.extra', version = false },
    },
    config = function()
        local minipick = require('mini.pick')
        local miniextra = require('mini.extra')
        vim.keymap.set('n', '<leader>ff', minipick.builtin.files, { desc = '[F]ind [F]iles' })
        vim.keymap.set('n', '<leader><leader>', minipick.builtin.buffers, { desc = '[ ] Find existing buffers' })
        vim.keymap.set('n', '<leader>fs', function()
            miniextra.pickers.lsp({ scope = 'document_symbol' })
        end, { desc = '[F]ind [S]ymbol in Buffer' })
    end
}
