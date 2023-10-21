local M = {}

-- Sections for default settings
M.sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'filetype'},
    lualine_y = {},
    lualine_z = { "location" },
}

function M.get_sections()
    return M.sections
end

return M
