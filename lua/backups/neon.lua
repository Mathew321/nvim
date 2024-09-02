
return {
    "rafamadriz/neon",
    config = function ()
        vim.cmd[[colorscheme neon]]
        vim.g.neon_style = "dark"
        vim.g.neon_transparent = true
    end
}
