-- Provide Topline Tab Indicator
return {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
        options = {
            mode = "buffers",
            separator_style = "thick",
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "󰥨  File Explorer",
                    text_align = "left",
                    separator = true
                }
            },
        },
    },
}
