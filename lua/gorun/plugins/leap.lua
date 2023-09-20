return {
    "ggandor/leap.nvim",
    dependencies = {
        "tpope/vim-repeat",
    },
    event = "VeryLazy",
    config = function ()
        local keymap = vim.keymap.set
        local leap = require("leap")
        local function jump_current_window()
            leap.leap{ target_windows = { vim.fn.win_getid() } }
        end

        local function jump_global_window()
            local windows = require("leap.util").get_enterable_windows()
            table.insert(windows, vim.fn.win_getid())
            leap.leap{ target_windows = windows }
        end
        keymap("n", "<M-j>", jump_current_window, desc "[J]ump")
        keymap("n", "<leader>j", jump_current_window, desc "[J]ump")
        keymap("n", "<M-k>", jump_global_window, desc "[J]ump All Windows")
        keymap("n", "<leader>J", jump_global_window, desc "[J]ump All Windows")
    end }
