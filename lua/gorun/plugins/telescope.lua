return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = function(plugin)
                local Process = require("lazy.manage.process")
                if jit.os == "Linux" then
                    Process.exec("cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release", { cwd = plugin.dir })
                else -- Then on Windows, we need to install it (moving it out from x64-ish dirs)
                    Process.exec("cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build", { cwd = plugin.dir })
                end
            end
        }
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local builtin = require("telescope.builtin")

        telescope.setup {
            defaults = {
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-e>"] = actions.close,
                        ["<Esc>"] = actions.close, -- Exit immediately when esc pressed
                        ["<M-CR>"] = actions.select_vertical,
                    },
                },
            },
        }

        telescope.load_extension("fzf")

        local keymap = vim.keymap.set
        keymap("n", "<leader>sf", builtin.find_files, desc "[S]earch [F]iles")
        keymap("n", "<leader>sh", builtin.help_tags, desc "[S]earch [H]elp")
        keymap("n", "<leader>sk", builtin.keymaps, desc "[S]earch [K]eymaps")
        keymap("n", "<leader>lg", builtin.live_grep, desc "[L]ive [G]rep")
        keymap("n", "<leader><leader>", builtin.buffers, desc "Search Buffers")
        keymap("n", "<leader>/", builtin.current_buffer_fuzzy_find, desc "Search Current File")
    end
}
