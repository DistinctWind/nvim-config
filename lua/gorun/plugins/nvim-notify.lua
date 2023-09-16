return {
    'rcarriga/nvim-notify',
    config = function()
        local notify = require("notify")
        notify.setup {
            stages = "slide",
            timeout = 5000,
            max_width = 50,
            render = "wrapped-compact"
        }
        vim.notify = notify
    end
}
