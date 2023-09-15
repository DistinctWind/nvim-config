return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "java", "python", "javascript", "html" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
            ignore_install = {},
            auto_install = true,
            modules = {}
        })
    end
}