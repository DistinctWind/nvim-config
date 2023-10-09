return {
    "szw/vim-maximizer",
    config = function ()
        local keymap = vim.keymap.set
        local desc = require("gorun.keymaps").desc
        keymap("n", "<C-o>", ":MaximizerToggle<CR>", desc "[O]verfill the window")
    end
}
