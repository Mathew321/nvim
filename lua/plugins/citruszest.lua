
return {
    "zootedb0t/citruszest.nvim",
    lazy = false,
    priority = 1000,
    config = function ()
        vim.cmd("colorscheme citruszest")
        vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
    end
}
