vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.o.showtabline = 2

vim.o.tabline = '%!v:lua.MyTabLine()'

function MyTabLine()
    local s = ''
    local current_tab = vim.fn.tabpagenr()
    for i = 1, vim.fn.tabpagenr('$') do
        local winnr = vim.fn.tabpagewinnr(i)
        local buflist = vim.fn.tabpagebuflist(i)
        local bufnr = buflist[winnr]
        local bufname = vim.fn.bufname(bufnr)
        local bufname_short = vim.fn.fnamemodify(bufname, ':t')  -- Get the file name

        if i == current_tab then
            s = s .. '%#TabLineSel#'  -- Highlight current tab
        else
            s = s .. '%#TabLine#'  -- Default highlight for other tabs
        end

        s = s .. '%' .. i .. 'T' .. i .. ':' .. bufname_short .. ' %T'
        if i < vim.fn.tabpagenr('$') then
            s = s .. ' | '  -- Separator between tabs
        end
    end
    return s
end
