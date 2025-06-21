local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.number = false
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.diagnostic.config({ virtual_lines = false })
-- initialisasi plugins
local importdata = {
	{
		"Soedjamal/ixancode-nvim-lazy",
		import = "pcode.plugins",
	},
}

local theme = pcode.themes or {}
for key, _ in pairs(theme) do
	table.insert(importdata, { import = "pcode.plugins.theme." .. key })
end

-- load language config
local lang = pcode.lang or {}
for key, value in pairs(lang) do
	if value then
		table.insert(importdata, { import = "pcode.plugins.lang." .. key })
	end
end

table.insert(importdata, { import = "plugins" })

require("lazy").setup({
	spec = importdata,
	defaults = {
		lazy = true, 
		version = "*", 
	},
	ui = {
		backdrop = 100,
		border = "rounded",
		browser = "chrome",
		throttle = 40,
		custom_keys = { ["<localleader>l"] = false },
		icons = {
			ft = "",
			lazy = "󰂠 ",
			loaded = " ",
			not_loaded = "",
		},
	},
	change_detection = { enabled = false, notify = false },
	checker = { enabled = false },
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
				"lazyredraw",
			},
		},
	},
})
