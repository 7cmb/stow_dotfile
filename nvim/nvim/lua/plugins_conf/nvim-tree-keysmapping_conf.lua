
---@ GLOBAL SELF MAPPING
-- vim.keymap.set('n', '<C-l>',function() vim.api.nvim_exec2("NvimTreeToggle",{output}) end)
vim.keymap.set('n', '<C-l>',function() vim.api.nvim_cmd({cmd="NvimTreeToggle"},{output}) end)

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
--  vim.keymap.set('n', '<C-l>', api.tree.toggle,        opts('Toggle'))
  vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
end

-- pass to setup along with your other options
require("nvim-tree").setup {
  ---
  on_attach = my_on_attach,
  ---
}
