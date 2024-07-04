
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
 })
end
vim.opt.rtp:prepend(lazypath)
---@diagnostic disable-next-line: unused-local
local opts = {}

require('vim-settings')
require("lazy").setup("plugins")

vim.keymap.set("n", '<leader>pv', vim.cmd.Ex)
vim.opt.clipboard = 'unnamedplus'
vim.keymap.set("n", '<leader>y', 'yy')

-- Set keymap for python auto fill def main()
vim.keymap.set(
    "n",
    "<leader>ee",
    ":call append('.', ['class C():', '    def __init__(self):', '        pass', '', '    def start(self):', '        pass', '', '    def stop(self):', '        pass', '', 'def main():', '    pass', '', 'if __name__ == \"__main__\":', '    try:', '        main()', '    except KeyboardInterupt:', '        print(\"\\n\\n[INFO] System Exit!\")'])<CR>"
)

vim.wo.relativenumber = true

-- Define a function to set up the autocmd
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

