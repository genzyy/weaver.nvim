local M = {}

M._stack = {}
M._is_window_open = false

M.setup = function()
    require("weaver.commands")
end

return M
