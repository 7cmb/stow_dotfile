vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.highlight.priorities.syntax = 50 
vim.opt.clipboard:append {'unnamedplus'}
-- vim.opt.hidden = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.cmd.colorscheme('desert')
vim.cmd.colorscheme('habamax')

---@ OFFIAL OSC52
--vim.g.clipboard = {
--	name = 'OSC 52',
--	copy = {
--		['+'] = require('vim.ui.clipboard.osc52').copy('+'),
--		['*'] = require('vim.ui.clipboard.osc52').copy('*'),
--	},
--	paste = {
--		['+'] = require('vim.ui.clipboard.osc52').paste('+'),
--		['*'] = require('vim.ui.clipboard.osc52').paste('*'),
--	},
--}
---END
