
return {
    "akinsho/toggleterm.nvim",
    config = function ()
        local toggleterm = require("toggleterm")
        toggleterm.setup({
            vim.keymap.set('n', '<leader>tt', vim.cmd.ToggleTerm)
        })
    end
}
