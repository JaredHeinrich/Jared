vim.cmd('highlight clear')
vim.cmd('syntax reset')

local colors = {
    background = '#282739',
    normal_text = '#eef0f0',
    status_line = '#33374f',

    black = '#000000',
    white = '#ffffff',
    lightGray = '#a8a8a8',
    gray = '#494949',
    darkGray = '#1c1c1c',

    lightBlue = "#8CCDEB",
    blue = "#8aadf4",
    teal = "#7FB4CA",
    darkTeal = "#309898",
    lightGreen = "#a6da95",
    green = "#98BB6C",
    yellow = "#f9d791",
    darkYellow = "#DCA561",
    lightOrange = "#f5a97f",
    orange = "#FFA066",
    lightRed = "#ed8796",
    red = '#FF5D62',
    lightPurple = "#c6a0f6",
    purple = "#957FB8",

    undefined = '#00ff56',
}

local highlights = {
    Normal = { bg = colors.background, fg = colors.normal_text },
    SignColumn = { bg = colors.background },
    NormalNC = { bg = colors.background },
    VertSplit = { bg = colors.undefined },
    StatusLine = { bg = colors.darkGray, fg = colors.normal_text },
    StatusLineNC = { bg = colors.darkGray, fg = colors.normal_text },
    LineNr = { fg = colors.normal_text },
    CursorLine = { bg = colors.darkGray },
    CursorLineNr = { fg = colors.orange },
    ColorColumn = { bg = colors.red },

    Comment = { fg = colors.lightGray },

    Keyword = { fg = colors.red },
    Function = { fg = colors.blue },
    Structure = { fg = colors.yellow },
    ["@variable"] = { fg = colors.normal_text },
    ["@variable.member"] = { fg = colors.yellow },
    Operator = { fg = colors.normal_text },
    Type = { fg = colors.teal },
    Constant = { fg = colors.orange },
    Special = { fg = colors.lightBlue },

    String = { fg = colors.lightGreen },
    Boolean = { fg = colors.lightPurple },
    Number = { fg = colors.lightRed },

    NormalFloat = { bg = colors.darkGray },
    NormalSB = { bg = colors.darkGray },
    TelescopeNormal = { bg = colors.darkGray },
    TelescopeBorder = { bg = colors.darkGray, fg = colors.darkGray },
    MasonNormal = { bg = colors.darkGray },
    MiniPickNormal = { bg = colors.darkGray },

    Pmenu = { bg = colors.darkGray },

    Identifier = { fg = colors.yellow },
    Statement = { fg = colors.undefined },
}

for group, opt in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, opt)
end

