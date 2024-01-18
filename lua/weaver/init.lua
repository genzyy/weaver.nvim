--- @class WinProperties
--- @field height integer?
--- @field width integer?
--- @field use_filename_as_weaver_title boolean?
local WinProperties = {
  height = 30,
  width = 90,
  use_filename_as_weaver_title = false,
}

--- @class Weaver
--- @field _stack table
--- @field _is_window_open boolean
--- @field win_properties WinProperties
local Weaver = {}

Weaver._stack = {}
Weaver._is_window_open = false

Weaver.win_properties = WinProperties

function Weaver:new()
  local weaver = setmetatable({}, self)
  return weaver
end

--- @param win_properties WinProperties?
function Weaver:setup(win_properties)
  if win_properties then
    Weaver.win_properties = {
      height = win_properties.height or Weaver.win_properties.height,
      width = win_properties.width or Weaver.win_properties.width,
      use_filename_as_weaver_title = win_properties.use_filename_as_weaver_title
        or Weaver.win_properties.use_filename_as_weaver_title,
    }
  end
  require("weaver.commands")
end

function Weaver:_clear()
  self._stack = {}
end

return Weaver
