local M = {}
-- Here's a breakdown of what each part means:
-- %: Represents the current file name.
-- :p: Turns the file name into an absolute path.
-- :h: Strips off the last component of the path, effectively returning the directory of the file.
-- Combining these, "%:p:h" is used to get the absolute directory path of the current file.

-- Define a function to copy the absolute path to the system clipboard
function M.CopyAbsPathToClipboard()
	-- Get the absolute path of the current file
	local abs_path = vim.fn.expand("%:p:h")
	-- Copy the absolute path to the system clipboard
	vim.fn.setreg("+", abs_path)
	-- Notify the user
	print("Copied to clipboard: " .. abs_path)
end

function M.GetFileNameFromPathAndPaste()
	local filepath = vim.fn.getreg("%")
	local filename = vim.fn.fnamemodify(filepath, ":t")
	filename = filename:gsub("%..-$", "") -- Remove everything after the last dot
	vim.fn.setreg("o", filename)
	vim.cmd('normal! "op')
end

function M.SaveFileNameToSystemRegister()
	local filepath = vim.fn.getreg("%")
	local filename = vim.fn.fnamemodify(filepath, ":t")
	filename = filename:gsub("%..-$", "") -- Remove everything after the last dot
	vim.fn.setreg("*", filename)
	print("Filename copied to system register")
end

function M.SetPathAsCurrent()
    local abs_path = vim.fn.expand("%:p:h")

	vim.cmd("cd " .. string.format("%s", abs_path))

	print("Changed directory to: " .. abs_path)
end

return M
