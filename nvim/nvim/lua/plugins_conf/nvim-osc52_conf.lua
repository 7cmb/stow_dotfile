vim.keymap.set('n', '<leader>c', require('osc52').copy_operator, {expr = true})
vim.keymap.set('n', '<leader>cc', '<leader>c_', {remap = true})
vim.keymap.set('v', '<leader>c', require('osc52').copy_visual)

-- DESCRIBE : USE REG+ TO SAVE OSCYABK
--function copy()
--  if vim.v.event.operator == 'y' and vim.v.event.regname == '+' then
--    require('osc52').copy_register('+')
--  end
--end
--
--vim.api.nvim_create_autocmd('TextYankPost', {callback = copy})

-- DESCRIBE : USE OSC52 CLIPBOARD FOR YANK
local function copy(lines, _)
  require('osc52').copy(table.concat(lines, '\n'))
end

local function paste()
  return {vim.fn.split(vim.fn.getreg(''), '\n'), vim.fn.getregtype('')}
end

vim.g.clipboard = {
  name = 'osc52',
  copy = {['+'] = copy, ['*'] = copy},
  paste = {['+'] = paste, ['*'] = paste},
}

-- Now the '+' register will copy to system clipboard using OSC52
vim.keymap.set('n', '<leader>c', '"+y')
vim.keymap.set('n', '<leader>cc', '"+yy')
