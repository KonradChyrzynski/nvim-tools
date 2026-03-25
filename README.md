# nvim-tools

**nvim-tools** A collection of essential utilities and quality-of-life enhancements designed to fill the functional gaps in Neovim's default feature set.

## Features

- 📋 Copy the absolute directory of the current file to the system clipboard
- 📝 Extract and paste the filename (without extension) from a path
- 💾 Save the filename (without extension) to the system clipboard
- 📁 Change the working directory to the path of the current file
- Delete one item from quickfix list
- Delete many items from quickfix list from visual mode

## Usage

Each function can be called directly in Lua or mapped to keys in your Neovim config.

# Example Keymaps

```lua
local function setup()
    -- Define the custom command
    vim.cmd("command! -nargs=0 GetFileNameAndPaste call v:lua.GetFileNameFromPathAndPaste()")
    vim.cmd("command! -nargs=0 SaveFileNameToClipboard call v:lua.SaveFileNameToSystemRegister()")
    vim.cmd("command! -nargs=0 SetPathAsCurrent call v:lua.SetPathAsCurrent()")

    -- Define the mapping
    vim.api.nvim_set_keymap('n', '<leader>pfn', ':GetFileNameAndPaste<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>cfn', ':SaveFileNameToClipboard<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>cd', ':SetPathAsCurrent<CR>', { noremap = true, silent = true })
end

setup()

-- Map the function to a key combination, e.g., <leader>cp
vim.api.nvim_set_keymap('n', '<leader>cpp', ':lua CopyAbsPathToClipboard()<CR>', { noremap = true, silent = true })
```
Set keymaps for quickfix window
```lua
TODO
```
