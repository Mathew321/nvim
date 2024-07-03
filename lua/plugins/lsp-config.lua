
return {
   {
   "williamboman/mason.nvim",
   config = function()
      require("mason").setup()
   end
   },
   {
      "williamboman/mason-lspconfig.nvim",
      config = function()
         require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls", --Lua serv
                                 "rust_analyzer", --Rust serv
                                 "clangd", --C, Cpp serv
                                 "jdtls", --Java
                                 "jdtls", --Java serv
                                 "quick_lint_js", --Javascript serv
                                 "jedi_language_server", --Python serv
            }
         })
      end
   },
   {
      "neovim/nvim-lspconfig",
      config = function()
         local lspconfig = require("lspconfig")
         local capabilities = require('cmp_nvim_lsp').default_capabilities()
         lspconfig.lua_ls.setup({
            capabilities = capabilities
         })
         lspconfig.jedi_language_server.setup({
            capabilities = capabilities
         })
         lspconfig.jdtls.setup({
            capabilities = capabilities
         })

         vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
         vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {})
         vim.keymap.set( 'n', '<leader>ca', vim.lsp.buf.code_action, {})
      end
   }
}

