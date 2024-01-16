local weaver = require("weaver")
local ui = require("weaver.ui")

local M = {}

local bufnr = nil
local buf_map = weaver._stack

--- @param buf number
--- @return string
M._format_index = function(buf)
  return string.format("_%d", buf)
end

--- @return number
M.get_current_buffer = function()
  return vim.api.nvim_get_current_buf()
end

--- @param is_global boolean | nil
M.open_weaver = function(is_global)
  local curr_buf
  if is_global == true then
    curr_buf = 0
  else
    curr_buf = M.get_current_buffer()
  end
  local contents = buf_map[M._format_index(curr_buf)]

  if contents == nil then
    contents = {}
  end

  weaver._is_window_open = true
  local win_opts = {}
  local cb = function(_, _sel) end

  local win_title

  if is_global then
    win_title = "Global"
  elseif weaver.win_properties.use_filename_as_weaver_title then
    win_title = vim.fn.expand("%")
  end

  bufnr = ui.show_window(
    win_opts,
    cb,
    weaver.win_properties.height,
    weaver.win_properties.width,
    win_title
  )
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, contents)
  local quit_command = ":CloseWeaver"
  if is_global == true then
    quit_command = quit_command .. " g"
  end
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "q",
    quit_command .. "<CR>",
    { silent = true }
  )
end

--- @param is_global boolean | nil
M.close_weaver = function(is_global)
  weaver._is_window_open = false
  local buf_content = M.get_buffer_lines()
  ui.close_window()
  local curr_buf
  if is_global == true then
    curr_buf = 0
  else
    curr_buf = M.get_current_buffer()
  end
  buf_map[M._format_index(curr_buf)] = buf_content
end

--- @param is_global boolean
M.destroy_weaver = function(is_global)
  local curr_buf
  if is_global == true then
    curr_buf = 0
  else
    curr_buf = M.get_current_buffer()
  end

  buf_map[M._format_index(curr_buf)] = nil
end

--- @return table
M.get_buffer_lines = function()
  if bufnr == nil then
    return {}
  end

  return vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
end

return M
