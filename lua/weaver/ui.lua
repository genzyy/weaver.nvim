local popup = require("plenary.popup")
local M = {}

local win = nil
local win_config = {
	height = 30,
	width = 90,
	borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
}

--- @param opts table
--- @param cb function
--- @return integer
M.show_window = function(opts, cb)
	win = popup.create(opts, {
		title = "Weaver",
		highlight = "WeaverWindow",
		line = math.floor(((vim.o.lines - win_config.height) / 2) - 1),
		col = math.floor((vim.o.columns - win_config.width) / 2),
		minheight = win_config.height,
		minwidth = win_config.width,
		borderchars = win_config.borderchars,
		callback = cb,
	})

	local bufnr = vim.api.nvim_win_get_buf(win)
	return bufnr
end

M.close_window = function()
	if win == nil then
		return
	end
	vim.api.nvim_win_close(win, true)
end

return M
