require("irateswami")

vim.api.nvim_set_keymap('n', '<leader>cp', ':let @+=expand("%:p")<CR>', { noremap = true, silent = true })

vim.o.foldenable = true

vim.o.foldmethod = 'indent'

local copy_symbol_under_cursor = function() local symbol = vim.fn.expand('<cword>') vim.fn.setreg('+', symbol)
end

vim.api.nvim_create_user_command('CopySymbolName', copy_symbol_under_cursor, {})

vim.api.nvim_set_keymap('n', '<leader>cs', ':CopySymbolName<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>cp', ':let @+=expand("%:p")<CR>', { noremap = true, silent = true })

-- Function to copy highlighted text to the "+ register (system clipboard)
local function copy_to_system_clipboard()
  vim.cmd('normal! \"+y')
end

-- Make the function accessible globally
_G.copy_to_system_clipboard = copy_to_system_clipboard

-- Key mapping: Adjust '<leader>c' to your preferred shortcut
vim.api.nvim_set_keymap('v', '<leader>c', ':lua copy_to_system_clipboard()<CR>', { noremap = true, silent = true })

vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "*",
    callback = function()
        vim.cmd("normal! zR")
        vim.cmd("normal! zM")
    end,
})

if vim.fn.has("persistent_undo") == 1 then
    vim.o.undodir = vim.fn.expand("$HOME/.undodir")
    vim.o.undofile = true
end

local function copy_path_and_line()
    local file_path = vim.fn.expand('%:p')  -- Get the full path of the current file
    local line_num = vim.fn.line('.')       -- Get the current line number
    local full_path_with_line = file_path .. ':' .. line_num  -- Concatenate path and line
    vim.fn.setreg('+', full_path_with_line) -- Set the "+" register (system clipboard)
end

_G.copy_path_and_line = copy_path_and_line  -- Make the function globally accessible

-- Set up the keymap to call the global function
vim.api.nvim_set_keymap('n', '<leader>cfp', ':lua _G.copy_path_and_line()<CR>', { noremap = true, silent = true })

