local M = {}

M._stack = {}
M._is_window_open = false

--- @class WinProperties
--- @field height integer?
--- @field width integer?
--- @field use_filename_as_weaver_title boolean?
local WinProperties = {
  height = 30,
  width = 90,
  use_filename_as_weaver_title = false,
}

M.win_properties = WinProperties

--- @param win_properties WinProperties?
function M.setup(win_properties)
  if win_properties then
    M.win_properties = {
      height = win_properties.height or M.win_properties.height,
      width = win_properties.width or M.win_properties.width,
      use_filename_as_weaver_title = win_properties.use_filename_as_weaver_title
          or M.win_properties.use_filename_as_weaver_title,
    }
  end
  require("weaver.commands")
end

return M
