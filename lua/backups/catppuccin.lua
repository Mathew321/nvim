
return { 
   "catppuccin/nvim",
   name = "catppuccin",
   priority = 1000,
   config = function()
        vim.cmd.colorscheme "catppuccin"
        vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
       vim.cmd.colorscheme "catppuccin"
   end
}
