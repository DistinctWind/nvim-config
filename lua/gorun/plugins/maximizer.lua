-- Config maximizer plugin before it loads
vim.g.maximizer_set_default_mapping = 1

return {
    event = "VeryLazy",
    "szw/vim-maximizer",
    config = function ()
        local keymap = vim.keymap.set
        local desc = require("gorun.keymaps").desc
    end
}
