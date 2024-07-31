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
