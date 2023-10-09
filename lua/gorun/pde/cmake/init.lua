local M = {}

function M.setup()
    local workspace = M.detect_workspace()
    if workspace then
        M.trigger_plugin_load()
    end
end

function M.detect_workspace()
    for name, file_type in vim.fs.dir(".") do
        if name == "CMakeLists.txt" and  file_type == "file" then
            return true
        end
    end
    return false
end

function M.trigger_plugin_load()
    vim.notify("CMake Project Detected", vim.log.levels.INFO)
    vim.api.nvim_exec_autocmds("User", {
        pattern = "GorunCMakeProject"
    })
end

return M
