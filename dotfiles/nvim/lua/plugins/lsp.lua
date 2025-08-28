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
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
        },
        config = function()
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = '[R]e[n]ame' })
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {desc = 'Open [C]ode [A]ctions'})

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())


            vim.lsp.enable('rust_analyzer')

            vim.lsp.config('dartls', {
                cmd = { "dart", "language-server", "--protocol=lsp" },
                filetypes = { "dart" },
                init_options = {
                    closingLabels = true,
                    outline = true,
                    flutterOutline = true
                }
            })
            vim.lsp.enable('dartls')

            vim.lsp.enable('jdtls')

            vim.lsp.enable('clangd')

            vim.lsp.enable('r_language_server')

            vim.lsp.enable('dockerls')

            vim.lsp.enable('hls')

            vim.lsp.enable('pylsp')

            vim.lsp.enable('pylsp')

            vim.lsp.enable('golsp')

            vim.lsp.config('ltex', {
                -- filetypes = {"typst"},
                settings = {
                    ltex = {
                        language = "de-DE",
                    },
                },
            })
            vim.lsp.enable('ltex')

            vim.lsp.enable('texlab')

            vim.lsp.config('tinymist', {
                single_file_support = true,
                settings = {
                    exportPdf = "onSave",
                },
                on_attach = function(client, bufnr)
                    vim.keymap.set("n", "<leader>tp", function()
                        client:exec_cmd({
                            title = "pin",
                            command = "tinymist.pinMain",
                            arguments = { vim.api.nvim_buf_get_name(0) },
                        }, { bufnr = bufnr })
                    end, { desc = "[T]inymist [P]in", noremap = true })
                    vim.keymap.set("n", "<leader>tu", function()
                        client:exec_cmd({
                            title = "unpin",
                            command = "tinymist.pinMain",
                            arguments = { vim.v.null },
                        }, { bufnr = bufnr })
                    end, { desc = "[T]inymist [U]npin", noremap = true })
                    vim.api.nvim_create_user_command("OpenPdf", function()
                        local filepath = vim.api.nvim_buf_get_name(0)
                        if filepath:match("%.typ$") then
                            local pdf_path = filepath:gsub("%.typ$", ".pdf")
                            vim.system({ "zathura", pdf_path })
                        end
                    end, {})
                end,
            })
            vim.lsp.enable('tinymist')

            vim.lsp.config('lua_ls', {
                settings = {
                    Lua = {
                        completion = {
                            callSnippet = 'Replace',
                        },
                    },
                },
            })
            vim.lsp.enable('lua_ls')
        end,
    },
}
