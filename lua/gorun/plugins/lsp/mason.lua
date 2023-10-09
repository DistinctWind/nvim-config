return {
    event = "VeryLazy",
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local settings = require("gorun.lsp_settings")
        settings.setup()

        mason.setup {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        }

        mason_lspconfig.setup {
            ensure_installed = settings.ensure_installed
        }
    end
}
