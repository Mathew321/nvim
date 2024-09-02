vim.opt.number = true

vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.g.mapleader = " "
vim.wo.relativenumber = true

-- Vim options
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.clipboard = 'unnamedplus'

-- Advanced yank highlighting
local function setup_highlight_on_yank()
    -- Create an autogroup for managing the autocmds
    vim.api.nvim_command('augroup kickstart_highlight_yank')
    vim.api.nvim_command('autocmd!')
    -- Define the autocmd to trigger after text is yanked
    vim.api.nvim_command('autocmd TextYankPost * lua vim.highlight.on_yank()')
    -- End the autogroup
    vim.api.nvim_command('augroup END')
end

-- Call the function to set up the autocmd
setup_highlight_on_yank()
