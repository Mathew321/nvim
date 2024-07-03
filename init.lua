
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
vim.keymap.set("v", '<leader>y', '"+y')

-- Set keymap for python auto fill def main()
vim.keymap.set(
    "n",
    "<leader>ee",
    ":call append('.', ['class C():', '    def __init__(self):', '        pass', '', '    def start(self):', '        pass', '', '    def stop(self):', '        pass', '', 'def main():', '    pass', '', 'if __name__ == \"__main__\":', '    try:', '        main()', '    except KeyboardInterupt:', '        print(\"\\n\\n[INFO] System Exit!\")'])<CR>"
)

vim.wo.relativenumber = true
