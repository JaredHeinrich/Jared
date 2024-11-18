return {{
        "lervag/vimtex",
        lazy = false,
        init = function()
        vim.g.vimtex_quickfix_mode = 0
        vim.g.vimtex_syntax_enabled = 1
        vim.g.vimtex_format_enabled = 1
        vim.g.vimtex_compiler_method = 'latexmk'
        vim.g.vimtex_view_method = 'zathura'
        vim.g.vimtex_compiler_progname = 'nvr'
        vim.g.vimtex_view_autoclose = 1

        vim.api.nvim_set_keymap('n', '<leader>ll', '<cmd>VimtexCompile<CR>', {noremap = true, silent = true})
        vim.api.nvim_set_keymap('n', '<leader>le', '<cmd>VimtexError<CR>', {noremap = true, silent = true})
        vim.api.nvim_set_keymap('n', '<leader>li', '<cmd>VimtexInfo<CR>', {noremap = true, silent = true})
        vim.api.nvim_set_keymap('n', '<leader>lv', '<cmd>VimtexView<CR>', {noremap = true, silent = true})
        vim.api.nvim_set_keymap('n', '<leader>ls', '<cmd>VimtexStop<CR>', {noremap = true, silent = true})
        end
    }}
