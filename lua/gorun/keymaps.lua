local M = {}

M.default_opts = { noremap = true, silent = true }

function M.desc(desc_string)
    local opt = vim.deepcopy(M.default_opts)
    if desc_string then
        opt.desc = desc_string
    end
    return opt
end

function M.init_keymap()
    local keymap = vim.keymap.set
    local desc = M.desc

    keymap("", " ", "<Nop>", M.default_opts)
    vim.g.mapleader = " "
    vim.g.maplocalleader = " "

    keymap("n", "H", ":bprev<CR>", desc "Goto Previous Tab")
    keymap("n", "L", ":bnext<CR>", desc "Goto Next Tab")
    keymap("n", "<M-h>", ":tabprevious<CR>", desc "Goto Previous Tab")
    keymap("n", "<M-l>", ":tabnext<CR>", desc "Goto Next Tab")

    -- Window Focus Movement
    keymap("n", "<C-h>", "<C-w>h", desc "Move to Left Window")
    keymap("n", "<C-j>", "<C-w>j", desc "Move to Down Window")
    keymap("n", "<C-k>", "<C-w>k", desc "Move to Up Window")
    keymap("n", "<C-l>", "<C-w>l", desc "Move to Left Window")

    -- Window Resizing
    keymap("n", "<C-Up>", ":resize +2<CR>", desc "Bigger Window")
    keymap("n", "<C-Down>", ":resize -2<CR>", desc "Smaller Window")
    keymap("n", "<C-Left>", ":vertical resize -2<CR>", desc "Smaller Window")
    keymap("n", "<C-Right>", ":vertical resize +2<CR>", desc "Bigger Window")

    keymap("i", "jk", "<ESC>", desc "Quick Escape")
    keymap("i", "<S-CR>", "<ESC>o", desc "Edit Next New Line")
    keymap("i", "<M-CR>", "<ESC>o", desc "Edit Next New Line")

    -- Unify Indent
    keymap("v", "<", "<gv", desc "Remove Indent")
    keymap("v", ">", ">gv", desc "Add Indent")

    -- Note: "==" for reindent
    keymap("v", "p", '"_dP', desc "Content Keeping Replace")

    -- Terminal Focus Movement
    keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", desc "Terminal Move to Left Window")
    keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", desc "Terminal Move to Down Window")
    keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", desc "Terminal Move to Up Window")
    keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", desc "Terminal Move to Left Window")
end

return M
