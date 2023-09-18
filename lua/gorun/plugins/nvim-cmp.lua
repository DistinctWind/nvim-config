return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer", -- cmp source for buffers
        "hrsh7th/cmp-path", -- cmp source for file system
        "onsails/lspkind.nvim", -- beautiful pictograms
        "L3MON4D3/LuaSnip", -- Snip Engine
        "saadparwaiz1/cmp_luasnip", -- Snip sources for nvim-cmp
        "rafamadriz/friendly-snippets", -- Collections for snippets
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local lspkind = require("lspkind")

        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = {
                ["<C-k>"] = cmp.mapping.select_prev_item(),
                ["<C-j>"] = cmp.mapping.select_next_item(),
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-e>"] = cmp.mapping.abort(), -- close completion window
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<CR>"] = function(fallback)
                    if cmp.visible() then
                        cmp.confirm { select = false }
                    end
                    fallback()
                end,
                ["<Tab>"] = cmp.mapping(function (fallback)
                    if cmp.visible() then
                        cmp.confirm { select = true }
                    elseif luasnip.expandable() then
                        luasnip.expand()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { "i", "s" })
            },
            sources = cmp.config.sources {
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "buffer" },
                { name = "path" },
            },
            formatting = {
                format = lspkind.cmp_format {
                    maxwidth = 50,
                    ellipsis_char = "...",
                },
            },
        })
    end,
}
