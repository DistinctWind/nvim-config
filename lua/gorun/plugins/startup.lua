local function beautify_lua_cmd(cmd)
    return cmd:gsub("%s+", " ")
    end

return {
    "startup-nvim/startup.nvim",
    dependencies = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
    config = function()
        require("startup").setup {
            -- theme = "dashboard",
            section_1 = {
                type = "text",
                oldfiles_directory = false,
                align = "center",
                fold_section = false,
                title = "Logo",
                margin = -5,
                content = {
                    [[             _                                      _           _   ]],
                    [[            (_)                                    (_)         | |  ]],
                    [[__  ____   ___ _ __ ___    ______   _ __  _ __ ___  _  ___  ___| |_ ]],
                    [[\ \/ /\ \ / / | '_ ` _ \  |______| | '_ \| '__/ _ \| |/ _ \/ __| __|]],
                    [[ >  <  \ V /| | | | | | |          | |_) | | | (_) | |  __/ (__| |_ ]],
                    [[/_/\_\  \_/ |_|_| |_| |_|          | .__/|_|  \___/| |\___|\___|\__|]],
                    [[                                   | |            _/ |              ]],
                    [[                                   |_|           |__/               ]],
                },
                highlight = "Statement",
                default_color = "#FF0000",
                oldfiles_amount = 0,
            },
            section_2 = {
                type = "mapping",
                oldfiles_directory = false,
                align = "center",
                fold_section = false,
                title = "Mapping",
                margin = -10,
                content = {
                    { " [S]earch [F]ile", "Telescope find_files", "sf" },
                    { " [S]earch [W]ord", "Telescope live_grep", "sw" },
                    { " [S]elect [C]olorscheme", "Telescope colorscheme enable_preview=true", "sc" },
                    { " [G]it [B]ranch", "Telescope git_branches", "gb"},
                    { " [E]dit [C]onfig", beautify_lua_cmd [[lua do
                        vim.fn.chdir(vim.fn.stdpath("config"))
                        vim.cmd 'edit init.lua'
                    end]], "ec" },
                },
                highlight = "String",
                default_color = "#FF0000",
                oldfiles_amount = 0,
            },
            section_3 = {
                type = "text",
                oldfiles_directory = false,
                align = "center",
                fold_section = false,
                title = "Time",
                margin = -5,
                content = function()
                    local clock = "  " .. os.date "%H:%M"
                    local date = "  " .. os.date "%Y/%m/%d | %A"
                    return {clock, date}
                end,
                highlight = "Constant",
                default_color = "#FF0000",
                oldfiles_amount = 0,
            },
            parts = { "section_1", "section_2", "section_3" }
        }
    end
}
