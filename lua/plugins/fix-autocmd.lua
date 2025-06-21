return {
  {
    "nvim-lua/plenary.nvim", 
    lazy = false,
    priority = 1000,
    config = function()
      vim.api.nvim_clear_autocmds({ event = "TextYankPost" })

      vim.api.nvim_create_autocmd("TextYankPost", {
        group = vim.api.nvim_create_augroup("HighlightOnYank", { clear = true }),
        pattern = "*",
        callback = function()
          vim.highlight.on_yank({ timeout = 200 })
        end,
        desc = "Highlight on yank",
      })
    end,
  },
}
