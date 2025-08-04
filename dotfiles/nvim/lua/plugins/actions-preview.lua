return {
    "aznhe21/actions-preview.nvim",
    opts = {
        backend = { "telescope" }
    },
    config = function()
        vim.keymap.set("n", "<leader>ca", require("actions-preview").code_actions,
            {desc = "Open [C]ode [A]ctions"})
    end,
}
