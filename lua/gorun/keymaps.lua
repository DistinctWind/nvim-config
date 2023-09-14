local default_opts = { noremap = true, silent = true }

function desc(desc_string)
    local opt = vim.deepcopy(default_opts)
    if desc_string then
       opt.desc = desc_string
    end
    return opt
end

local term_opts = { silent = true }

local keymap = vim.keymap.set

keymap("", " ", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "H", ":tabp<CR>", desc "Goto Previous Tab")
keymap("n", "L", ":tabn<CR>", desc "Goto Previous Tab")

-- Add Save shortcuts
keymap("n", "<C-s>", ":w<CR>", desc "[S]ave Current Buffer")

-- Window Focus Movement
keymap("n", "<C-h>", "<C-w>h", desc "Move to Left Window")
keymap("n", "<C-j>", "<C-w>j", desc "Move to Down Window")
keymap("n", "<C-k>", "<C-w>k", desc "Move to Up Window")
keymap("n", "<C-l>", "<C-w>l", desc "Move to Left Window")

-- Open Explorer
keymap("n", "<leader>e", ":Lex 30<CR>", desc "Open [E]xplorer")

-- Window Resizing
keymap("n", "<C-Up>", ":resize +2<CR>", desc "Bigger Window")
keymap("n", "<C-Down>", ":resize -2<CR>", desc "Smaller Window")
keymap("n", "<C-Left>", ":resize -2<CR>", desc "Smaller Window")
keymap("n", "<C-Right>", ":resize +2<CR>", desc "Bigger Window")

keymap("i", "jk", "<ESC>", desc "Quick Escape")

-- Unify Indent
keymap("v", "<", "<gv", desc "Remove Indent")
keymap("v", ">", ">gv", desc "Add Indent")

-- Note: "==" for reindent
keymap("v", "<A-j>", ":move .+1<CR>==", desc "Grab and Move Down")
keymap("v", "<A-k>", ":move .-1<CR>==", desc "Grab and Move Up")
keymap("v", "p", '"_dP', desc "Content Keeping Replace")

-- Terminal Focus Movement
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", desc "Terminal Move to Left Window")
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", desc "Terminal Move to Down Window")
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", desc "Terminal Move to Up Window")
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", desc "Terminal Move to Left Window")
