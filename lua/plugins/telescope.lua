return {
   {
      'nvim-telescope/telescope.nvim', tag = '0.1.5',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function()
         local builtin = require("telescope.builtin")
         local actions = require("telescope.actions")
         local action_state = require("telescope.actions.state")
         local Path = require("plenary.path")
         local harpoon_mark = require("harpoon.mark")
         -- Custom grep function
         local function grep_current_file()
            local current_file = vim.fn.expand("%:p")
            builtin.grep_string({
               search = "",
               search_dirs = { vim.fn.expand("~") },
               attach_mappings = function(prompt_bufnr, map)
                  actions.select_default:replace(function()
                     local selection = action_state.get_selected_entry()
                     actions.close(prompt_bufnr)
                     harpoon_mark.add_file(selection.path)
                     vim.cmd("edit " .. selection.path)
                  end)
                  return true
               end,
            })
         end

         -- Key mappings
         vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
         vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
         vim.keymap.set('n', '<leader>gf', grep_current_file, {}) -- New key mapping for grepping current file
      end
   },
   {
      "nvim-telescope/telescope-ui-select.nvim",
      config = function()
         require("telescope").setup {
            extensions = {
               ["ui-select"] = {
                  require("telescope.themes").get_dropdown {}
               }
            }
         }
         require("telescope").load_extension("ui-select")
      end
   },
   {
      'ThePrimeagen/harpoon',
      config = function()
         require("harpoon").setup()
         vim.keymap.set('n', 'll', require("harpoon.mark").add_file, {})
         vim.keymap.set('n', '<leader>tm', require("harpoon.ui").toggle_quick_menu, {})
         vim.keymap.set('n', 'xx', require("harpoon.ui").nav_next, {})
         vim.keymap.set('n', 'zz', require("harpoon.ui").nav_prev, {})
      end
   },
}

