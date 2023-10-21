local M = {}

function M.check_android()
    local result = vim.fn.system("uname -a")
    if vim.v.shell_error ~= 0 then -- Can't exec `uname`, not unix-like system
        return false
    end
    if not string.match(result, "[aA]ndroid") then -- Is unix-like system, but not android at all
        return false
    end
    return true
end

-- Set the language server that use VM to run
-- Which could run in even android system
M.ensure_installed = { 'cmake', 'pyright', 'gopls' }

M.setup_finished = false

function M.setup()
    -- Only run M.setup for one time
    if M.setup_finished then
        return
    end
    M.setup_finished = true

    if M.check_android() then -- Must manually install for android
        return
    end
    local install_from_mason = {
        "lua_ls",
        "clangd",
        "zls",
    }
    for _, server_name in pairs(install_from_mason) do
        table.insert(M.ensure_installed, server_name)
    end
end

M.lsp_settings = {
    lua_ls = {
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
    },
    clangd = { },
    cmake = { },
    pyright = { },
    gopls = { },
    zls = { },
}

return M
