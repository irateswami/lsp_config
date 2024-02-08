require("irateswami")

vim.api.nvim_set_keymap('n', '<leader>cp', ':let @+=expand("%:p")<CR>', { noremap = true, silent = true })

vim.o.foldenable = true

vim.o.foldmethod = 'indent'

local copy_symbol_under_cursor = function()
    local symbol = vim.fn.expand('<cword>')
    vim.fn.setreg('+', symbol)
end

vim.api.nvim_create_user_command('CopySymbolName', copy_symbol_under_cursor, {})

vim.api.nvim_set_keymap('n', '<leader>cs', ':CopySymbolName<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>cp', ':let @+=expand("%:p")<CR>', { noremap = true, silent = true })

local function copy_highlight_to_clipboard()
  vim.cmd('normal! y')
  vim.notify("Highlighted text copied to clipboard")
end

vim.api.nvim_set_keymap('v', '<leader>y', ':lua copy_highlight_to_clipboard()<CR>', { noremap = true, silent = true })

vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "*",
    callback = function()
        vim.cmd("normal! zR")
        vim.cmd("normal! zM")
    end,
})
