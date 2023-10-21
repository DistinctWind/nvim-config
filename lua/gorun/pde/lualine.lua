local M = {}

-- Sections for default settings
M.sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {'encoding'},
    lualine_y = {'progress', 'location'},
    lualine_z = {{ 'filetype' , icons_enabled = false}},
}

function M.get_sections()
    if M.work_mode_set == false then
        M.set_work_mode("")
    end
    return M.sections
end

M.work_mode_set = false

---Set work mode
---@param mode string
function M.set_work_mode(mode)
    M.work_mode_set = true
    table.insert(M.sections.lualine_z, '"'..mode..'"')
end

return M
