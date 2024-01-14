local weaver = require("weaver")
local utils = require("weaver.utils")
local command = vim.api.nvim_create_user_command

local default_opts = {
    count = true,
    bang = true,
    nargs = "*",
    desc = "Custom weave",
}

command("Weaver", function(cargs)
    if weaver._is_window_open == true then
        return
    end

    local args = cargs.fargs
    utils.open_weaver(args[1] == "g")
end, default_opts)

command("CloseWeaver", function(cargs)
    if weaver._is_window_open == false then
        return
    end
    local args = cargs.fargs
    utils.close_weaver(args[1] == "g")
end, default_opts)

command("ToggleWeaver", function(cargs)
    local args = cargs.fargs
    local is_global = args[1] == "g"
    if weaver._is_window_open == false then
        utils.open_weaver(is_global)
    elseif weaver._is_window_open == true then
        utils.close_weaver(is_global)
    end
end, default_opts)

command("DestroyWeave", function(cargs)
    local args = cargs.fargs
    local is_global = args[1] == "g"

    utils.destroy_weaver(is_global)
end, default_opts)
