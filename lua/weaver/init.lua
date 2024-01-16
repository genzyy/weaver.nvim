local M = {}

M._stack = {}
M._is_window_open = false

--- @class CustomWindowConfig
--- @field height integer?
--- @field width integer?
local CustomWindowConfig = {
    height = 30,
    width = 90,
}

M.custom_window_config = CustomWindowConfig

--- @param custom_window_config CustomWindowConfig?
M.setup = function(custom_window_config)
    if custom_window_config then
        M.custom_window_config = {
            height = custom_window_config.height
                or M.custom_window_config.height,
            width = custom_window_config.width or M.custom_window_config.width,
        }
    end
    require("weaver.commands")
end

return M
