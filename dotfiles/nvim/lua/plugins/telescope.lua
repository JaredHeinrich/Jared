return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-ui-select.nvim',
        {'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font }
    },

    config = function()
        local telescope = require('telescope')
        local builtin = require('telescope.builtin')
        local actions = require('telescope.actions')
        require("telescope").load_extension("ui-select")

        telescope.setup({
            defaults = {
                file_ignore_patterns = {
                    "%.pdf",
                    "%.png",
                    "%.mp3",
                    "%.mp4",
                },
                mappings = {
                    i = {
                        ["<c-l>"] = false,
                        ["<Esc>"] = false,
                        ["<c-n>"] = false,
                        ["<c-p>"] = false,
                        ["<c-j>"] = actions.move_selection_next,
                        ["<c-k>"] = actions.move_selection_previous,
                        ["<c-s>"] = actions.add_selection,
                        ["qq"] = actions.close,
                    },
                    n = {
                        ["<Esc>"] = false,
                        ["q"] = actions.close,
                        ["dd"] = actions.delete_buffer,
                        ["<c-s>"] = actions.add_selection,
                    },
                },
            }
        })

        local telescope_bottom_window = {
            previewer = false,
            layout_strategy = 'bottom_pane',
            layout_config = {
                prompt_position = 'bottom',
                height = 0.3,
            },
            border = false,
        }

        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind by [G]rep' })
        vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = '[F]ind current [W]ord' })
        vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
        vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[F]ind [K]eymaps' })

        vim.keymap.set('n', 'gd', builtin.lsp_definitions, { desc = '[G]oto [D]efinition' })
        vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = '[G]oto [R]eferences' })
        vim.keymap.set('n', 'gi', builtin.lsp_implementations, { desc = '[G]oto [I]mplementation' })

        vim.keymap.set('n', '<leader>fs', function()
            builtin.lsp_document_symbols(telescope_bottom_window)
        end, { desc = '[F]ind [S]ymbol in Buffer' })

        vim.keymap.set('n', '<leader><leader>', function()
            builtin.buffers(telescope_bottom_window)
        end, { desc = '[ ] Find existing buffers' })

        vim.keymap.set('n', '<leader>/', function()
            builtin.current_buffer_fuzzy_find(telescope_bottom_window)
        end, { desc = '[/] Fuzzily search in current buffer' })


        vim.keymap.set('n', '<leader>fn', function()
            builtin.find_files { cwd = vim.fn.stdpath 'config' }
        end, { desc = '[F]ind [N]eovim config files' })
    end,
}
