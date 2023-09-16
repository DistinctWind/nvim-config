return {
    "ggandor/leap.nvim",
    dependencies = {
        "tpope/vim-repeat",
    },
    event = "VeryLazy",
    config = function ()
        local keymap = vim.keymap.set
        local leap = require("leap")
        keymap("n", "<leader>j", function()
            leap.leap{ target_windows = { vim.fn.win_getid() } }
        end, desc "[J]ump")
        keymap("n", "<leader>J", function()
            leap.leap{ target_windows = require('leap.util').get_enterable_windows() }
        end, desc "[J]ump All Windows")
    end
}
