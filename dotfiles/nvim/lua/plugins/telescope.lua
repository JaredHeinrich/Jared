return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font }
    },
    opts = {
        defaults = {
            file_ignore_patterns = {
                "target/",
                "CMakeFiles/",
                "node_modules/",
                "*.log",
                "*.fls",
                "*.aux",
                "*.fdb_latexmk",
                "*.synctex.gz",
                "*.bbl",
                "*.run.xml",
                "*.toc",
                "*.bcf",
                "*.out",
                "*.lof",
                "*.lot",
                "*.blg",
            }
        }
    },
    config = function()
        -- See `:help telescope` and `:help telescope.setup()`
        local builtin = require 'telescope.builtin'
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
        vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind by [G]rep' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
        vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = '[F]ind current [W]ord' })
        vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
        vim.keymap.set('n', '<leader>f.', builtin.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' })
        vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[F]ind [K]eymaps' })

        -- Slightly advanced example of overriding default behavior and theme
        vim.keymap.set('n', '<leader>/', function()
            -- You can pass additional configuration to Telescope to change the theme, layout, etc.
            builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                winblend = 10,
                previewer = false,
            })
        end, { desc = '[/] Fuzzily search in current buffer' })

        -- Shortcut for searching your Neovim configuration files
        vim.keymap.set('n', '<leader>fn', function()
            builtin.find_files { cwd = vim.fn.stdpath 'config' }
        end, { desc = '[F]ind [N]eovim config files' })
    end,
}
