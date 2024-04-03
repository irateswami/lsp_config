vim.g.mapleader = "\\"

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>tn", "<cmd>tabnew | :Explore<CR>")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

vim.api.nvim_set_keymap('n', '<leader>cp', ':let @+=expand("%:p")<CR>', { noremap = true, silent = true })

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.o.foldenable = true

vim.o.foldmethod = 'indent'

local copy_symbol_under_cursor = function() local symbol = vim.fn.expand('<cword>') vim.fn.setreg('+', symbol)
end

vim.api.nvim_create_user_command('CopySymbolName', copy_symbol_under_cursor, {})

vim.api.nvim_set_keymap('n', '<leader>cs', ':CopySymbolName<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>spc', ':Spectre<CR>', { noremap = true, silent = true })

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
