local popup = require("plenary.popup")
local M = {}

local win = nil

--- @param opts table
--- @param cb function
--- @param height integer
--- @param width integer
--- @param win_title string?
--- @return integer
function M.show_window(opts, cb, height, width, win_title)
  local borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }

  win = popup.create(opts, {
    title = win_title ~= nil and win_title ~= "" and win_title or "Weaver",
    highlight = "WeaverWindow",
    line = math.floor(((vim.o.lines - height) / 2) - 1),
    col = math.floor((vim.o.columns - width) / 2),
    minheight = height,
    minwidth = width,
    borderchars = borderchars,
    callback = cb,
  })

  local bufnr = vim.api.nvim_win_get_buf(win)
  return bufnr
end

function M.close_window()
  if win == nil then
    return
  end
  vim.api.nvim_win_close(win, true)
end

return M
