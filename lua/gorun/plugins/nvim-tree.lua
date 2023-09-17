return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function ()
        local tree = require("nvim-tree")
        tree.setup({
            view = {
                width = 30,
            },
        })
        vim.keymap.set("n", "<leader>E", ":NvimTreeToggle<CR>", desc "Toogle [E]xplorer")
        vim.keymap.set("n", "<leader>e", ":NvimTreeFocus<CR>", desc "Focus [E]xplorer")
    end
}
