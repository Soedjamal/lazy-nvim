require("core")
require("notify").setup({
  stages = "fade",
  timeout = 0, -- Notifikasi akan tetap muncul sampai ditutup secara manual
  max_width = 50,
  max_height = 10,
  background_colour = "#000000",
  on_open = function(win)
    vim.api.nvim_win_set_config(win, { border = "rounded" })
  end,
})
vim.notify = function() end -- Matikan semua notifikasi

local alpha = require("alpha")
local startify = require("alpha.themes.startify")




alpha.setup(startify.config)
