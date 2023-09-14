return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function ()
        local tree = require("nvim-tree")
        tree.setup({
            view = {
                width = 30,
            },
        })
        vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", desc "Toogle [E]xplorer")
    end
}
