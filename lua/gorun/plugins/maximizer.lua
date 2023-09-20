return {
    "szw/vim-maximizer",
    config = function ()
        local keymap = vim.keymap.set
        keymap("n", "<C-o>", ":MaximizerToggle<CR>", desc "[O]verfill the window")
    end
}
