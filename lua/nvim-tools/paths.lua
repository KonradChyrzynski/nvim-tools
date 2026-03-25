-- Here's a breakdown of what each part means:
-- %: Represents the current file name.
-- :p: Turns the file name into an absolute path.
-- :h: Strips off the last component of the path, effectively returning the directory of the file.
-- Combining these, "%:p:h" is used to get the absolute directory path of the current file.

-- Define a function to copy the absolute path to the system clipboard
function CopyAbsPathToClipboard()
	-- Get the absolute path of the current file
	local abs_path = vim.fn.expand("%:p:h")
	-- Copy the absolute path to the system clipboard
	vim.fn.setreg("+", abs_path)
	-- Notify the user
	print("Copied to clipboard: " .. abs_path)
end

function GetFileNameFromPathAndPaste()
	local filepath = vim.fn.getreg("%")
	local filename = vim.fn.fnamemodify(filepath, ":t")
	filename = filename:gsub("%..-$", "") -- Remove everything after the last dot
	vim.fn.setreg("o", filename)
	vim.cmd('normal! "op')
end

function SaveFileNameToSystemRegister()
	local filepath = vim.fn.getreg("%")
	local filename = vim.fn.fnamemodify(filepath, ":t")
	filename = filename:gsub("%..-$", "") -- Remove everything after the last dot
	vim.fn.setreg("*", filename)
	print("Filename copied to system register")
end

function SetPathAsCurrent()
	local filepath = vim.fn.getreg("%")
	local filename = vim.fn.fnamemodify(filepath, ":t")
	filename = filename:gsub("%..-$", "") -- Remove everything after the last dot
	vim.cmd("cd " .. filepath)
	print("Changed directory to: " .. filepath)
end
