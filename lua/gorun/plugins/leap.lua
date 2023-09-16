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
            local windows = require("leap.util").get_enterable_windows()
            table.insert(windows, vim.fn.win_getid())
            leap.leap{ target_windows = windows }
        end, desc "[J]ump All Windows")
    end }
