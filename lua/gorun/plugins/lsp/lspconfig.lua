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
        require("neodev").setup()

        local capabilities = cmp_nvim_lsp.default_capabilities()
        local keymap = vim.keymap.set
        local on_attach = function(_, bufnr)
            local desc = function (str)
                local opts = desc(str)
                opts.buffer = bufnr
                return opts
            end
            keymap("n", "gr", builtin.lsp_references, desc "[G]oto [R]eference")
            keymap("n", "gd", builtin.lsp_definitions, desc "[G]oto [D]efinitions")
        end

        lspconfig["lua_ls"].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                Lua = {
                    runtime = {
                        -- Tell the language server which version of Lua you're using
                        -- (most likely LuaJIT in the case of Neovim)
                        version = 'LuaJIT'
                    },
                    workspace = {
                        checkThirdParty = false,
                    }
                }
            }
        }
    end
}
