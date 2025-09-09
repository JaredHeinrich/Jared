return {
    {
        'williamboman/mason.nvim',
        -- lazy = false,
        dependencies = {
            'WhoIsSethDaniel/mason-tool-installer.nvim',
        },
        opts = {},
    },
    {
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        dependencies = {
            'williamboman/mason.nvim',
        },
        opts = {
            ensure_installed = {
                'clangd',
                'ltex-ls',
                'texlab',
                'tinymist',
                'lua-language-server',
                'stylua',
            },
        },
    },
}
