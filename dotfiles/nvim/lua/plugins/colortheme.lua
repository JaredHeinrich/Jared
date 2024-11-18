return {
    'rebelot/kanagawa.nvim',
    opts = {},
    config = function()
        require('kanagawa').setup({
            compile = false,
            undercurl = true,
            commentStyle = { italic = true },
            functionStyle = {},
            keywordStyle = { italic = true},
            statementStyle = { bold = true },
            typeStyle = {},
            transparent = true,
            dimInactive = false,
            terminalColors = true,
            theme = "wave",
            colors = {
                palette = {},
                theme = {
                    wave = {},
                    lotus = {},
                    dragon = {},
                    all = {
                        ui = {
                            bg_gutter = "none",
                        }
                    }
                },
            },
            overrides = function(colors)
                local theme = colors.theme
                return {
                    LineNr = { fg = colors.palette.autumnYellow},
                    TelescopeTitle = { fg = theme.ui.special, bold = true },
                    TelescopePromptNormal = { bg = theme.ui.bg_p1 },
                    TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
                    TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
                    TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
                    TelescopePreviewNormal = { bg = theme.ui.bg_dim },
                    TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
                }
            end,
            theme = "wave",
        })
        vim.cmd("colorscheme kanagawa")
    end,
}
