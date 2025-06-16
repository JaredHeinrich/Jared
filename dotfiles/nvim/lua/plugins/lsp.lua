return {
    {
        'folke/lazydev.nvim',
        ft = 'lua',
        opts = {
            library = {
                { path = 'luvit-meta/library', words = { 'vim%.uv' } },
            },
        },
    },
    { 'Bilal2453/luvit-meta', lazy = true },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            { 'williamboman/mason.nvim', config = true },
            'WhoIsSethDaniel/mason-tool-installer.nvim',
            'hrsh7th/cmp-nvim-lsp',
        },
        config = function()
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
                callback = function(event)
                    local map = function(keys, func, desc, mode)
                        mode = mode or 'n'
                        vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
                    end

                    -- Jump to the definition of the word under your cursor.
                    map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

                    -- Find references for the word under your cursor.
                    map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

                    -- Jump to the implementation of the word under your cursor.
                    map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

                    -- Jump to the type of the word under your cursor.
                    map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

                    -- Fuzzy find all the symbols in your current document.
                    map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

                    -- Fuzzy find all the symbols in your current workspace.
                    map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

                    -- Rename the variable under your cursor.
                    map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

                    local client = vim.lsp.get_client_by_id(event.data.client_id)
                    if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
                        local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
                        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                            buffer = event.buf,
                            group = highlight_augroup,
                            callback = vim.lsp.buf.document_highlight,
                        })

                        vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                            buffer = event.buf,
                            group = highlight_augroup,
                            callback = vim.lsp.buf.clear_references,
                        })

                        vim.api.nvim_create_autocmd('LspDetach', {
                            group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
                            callback = function(event2)
                                vim.lsp.buf.clear_references()
                                vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
                            end,
                        })
                    end
                end,
            })

            if vim.g.have_nerd_font then
                local signs = { Error = '', Warn = '', Hint = '', Info = '' }
                for type, icon in pairs(signs) do
                    local hl = 'DiagnosticSign' .. type
                    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
                end
            end

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())


            local mason_installs = {
                'rust-analyzer',
                'clangd',
                'r-languageserver',
                'dockerfile-language-server',
                'python-lsp-server',
                'gopls',
                'ltex-ls',
                'texlab',
                'tinymist',
                'lua-language-server',
                'stylua',
            }
            require('mason').setup()
            require('mason-tool-installer').setup { ensure_installed = mason_installs }

            vim.lsp.enable('rust_analyzer')
            vim.lsp.config('rust_analyzer', {
                on_attach = function(client, bufnr)
                    if client.server_capabilities.documentFormattingProvider then
                        vim.api.nvim_buf_set_keymap(bufnr, "n", "=", "<cmd>lua vim.lsp.buf.format()<CR>", { noremap = true, silent = true })
                    end
                end,
            })

            vim.lsp.enable('dartls')
            vim.lsp.config('dartls', {
                cmd = { "dart", "language-server", "--protocol=lsp" },
                filetypes = { "dart" },
                init_options = {
                    closingLabels = true,
                    outline = true,
                    flutterOutline = true
                }
            })

            vim.lsp.enable('clangd')
            vim.lsp.config('clangd', {})

            vim.lsp.enable('r_language_server')
            vim.lsp.config('r_language_server', {})

            vim.lsp.enable('dockerls')
            vim.lsp.config('dockerls', {})

            vim.lsp.enable('hls')
            vim.lsp.config('hls', {})

            vim.lsp.enable('pylsp')
            vim.lsp.config('pylsp', {})

            vim.lsp.enable('pylsp')
            vim.lsp.config('pylsp', {})

            vim.lsp.enable('golsp')
            vim.lsp.config('golsp', {})

            vim.lsp.enable('ltex')
            vim.lsp.config('ltex', {
                settings = {
                    ltex = {
                        language = "de-DE",
                    },
                },
            })

            vim.lsp.enable('texlab')
            vim.lsp.config('texlab', {})

            vim.lsp.enable('tinymist')
            vim.lsp.config('tinymist', {
                single_file_support = true,
                settings = {
                    exportPdf = "onSave",
                },
            })


            vim.lsp.enable('lua_ls')
            vim.lsp.config('lua_ls', {
                settings = {
                    Lua = {
                        completion = {
                            callSnippet = 'Replace',
                        },
                    },
                },
            })
        end,
    },
}
