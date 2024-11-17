return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ignore_install = {},
            modules = {},
            ensure_installed = {'lua'},
            sync_install = false,
            auto_install = false,
            highlight = {
                enable = true,
                disable = { "latex" },
                additional_vim_regex_highlighting = false,
            },
            indent = { enable = true },
        })
    end
}
