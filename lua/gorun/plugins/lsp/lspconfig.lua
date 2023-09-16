return {
    "neovim/nvim-lspconfig",
    -- This event will simply after starting mason and mason.lspconfig
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "folke/neodev.nvim",
    },
    config = function()
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local builtin = require("telescope.builtin")
        local settings = require("gorun.lsp_settings")
        settings.setup()
        require("neodev").setup()

        local capabilities = cmp_nvim_lsp.default_capabilities()
        local keymap = vim.keymap.set
        local on_attach = function(_, bufnr)
            local desc = function (str)
                local opts = desc(str)
                opts.buffer = bufnr
                return opts
            end
            keymap("n", "<leader>gr", builtin.lsp_references, desc "[G]oto [R]eference")
            keymap("n", "<leader>gd", builtin.lsp_definitions, desc "[G]oto [D]efinitions")
            keymap("n", "<leader>gi", builtin.lsp_implementations, desc "[G]oto [I]mplementations")
            keymap("n", "<leader>gt", builtin.treesitter, desc "[G]oto [T]reesitter")
            keymap("n", "<leader>gws", builtin.lsp_workspace_symbols, desc "[G]oto [W]orkspace [S]ymbols")
        end

        for server_name, config in pairs(settings.lsp_settings) do
            lspconfig[server_name].setup {
                capabilities = capabilities,
                on_attach = on_attach,
                settings = config,
            }
        end
    end
}
