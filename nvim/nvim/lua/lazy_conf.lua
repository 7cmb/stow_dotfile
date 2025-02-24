local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

---@ MANAGE PLUGINS
require("lazy").setup({
{"nvim-lualine/lualine.nvim",dependencies = { 'nvim-tree/nvim-web-devicons' }},
{name="osc52",dir="/home/baka/.config/nvim/plugins/nvim.osc52"},
{name="coc-install",dir="/home/baka/.config/nvim/plugins/coc.nvim"},
{name="indent-blankline",dir="/home/baka/.config/nvim/plugins/indent-blankline.nvim",main="ibl", --[[@module "ibl" @type ibl.config--]] opts={},},
{name="nvim-tree",dir="/home/baka/.config/nvim/plugins/nvim-tree.lua",version = "*",lazy = false,dependencies = {"nvim-tree/nvim-web-devicons",},config = function()  require("nvim-tree").setup {}  end,},
-- {name="nvim-tree",dir="/home/baka/.config/nvim/plugins/nvim-tree.lua",dependencies={"nvim-tree/nvim-web-devicons",},opt={}},
-- {name="sidebar",dir="/home/baka/.config/nvim/plugins/sidebar.nvim"},
	})

---@ IMPORT PLUGINS CONFIG
require('plugins_conf.nvim-osc52_conf')
require('plugins_conf.lualine_conf')
require('plugins_conf.coc-nvim_conf')
require('plugins_conf.nvim-tree_conf')
require('plugins_conf.nvim-tree-keysmapping_conf')
-- require('plugins_conf.sidebar_conf')
-- require('plugins_conf.lualine-evil_conf')
