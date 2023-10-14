return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function ()
        local tree = require("nvim-tree")
        local desc = require("gorun.keymaps").desc
        tree.setup({
            view = {
                width = 30,
            },
        })
        vim.keymap.set("n", "<leader>ee", ":NvimTreeFocus<CR>", desc "[E]xplorer")
        vim.keymap.set("n", "<leader>ec", ":NvimTreeClose<CR>", desc "[E]xplorer [C]lose")
    end
}
