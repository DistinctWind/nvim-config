local cmp = require("cmp")

return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-path",
    },
    opts = {
        mapping = {
            ["<C-j>"] = cmp.mapping.select_next_item(),
            ["<C-k>"] = cmp.mapping.select_prev_item(),
        },
        sources = {
            { name = 'path'},
        },
    },
}
