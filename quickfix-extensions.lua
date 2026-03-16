local M = {}

function M.remove_quickfix_item()
	local qflist = vim.fn.getqflist()
	local idx = vim.fn.line(".") -- Current line in quickfix window

	if idx > 0 and idx <= #qflist then
		table.remove(qflist, idx)
		vim.fn.setqflist(qflist, "r") -- Replace quickfix list
		-- Stay on the same line or move up if at end
		local new_idx = math.min(idx, #qflist)
		vim.cmd(("keepjumps execute %d . 'cc'"):format(new_idx)) -- jump to new idx
	end
end

function M.remove_quickfix_items_visual()
	local qflist = vim.fn.getqflist()
	local start_idx = vim.fn.line("v")
	local end_idx = vim.fn.line(".")

	if start_idx > end_idx then
		start_idx, end_idx = end_idx, start_idx
	end

	if start_idx > 0 and end_idx <= #qflist then
		-- Remove from last index to the first index
		for i = end_idx, start_idx, -1 do
			table.remove(qflist, i)
		end

		vim.fn.setqflist(qflist, "r") -- Switch quickfix list

		-- Quit visual mode
		local esc = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)
		vim.api.nvim_feedkeys(esc, "x", false)

		-- Set coursor on the right line if its available
		if #qflist > 0 then
			local new_idx = math.min(start_idx, #qflist)
			pcall(function()
				vim.cmd(string.format("keepjumps cc %d", new_idx))
			end)
		else
			-- If list is empty close the window
			vim.cmd("cclose")
		end
	end
end

return M
