
return {
{
  "goolord/alpha-nvim",
  opts = {
      dash_model = {
       [[    _   __                _             ]],
       [[   / | / /__  ____ _   __(_)___ ___    ]],
       [[  /  |/ / _ \/ __ \ | / / / __ `__ \  ]],
       [[ / /|  /  __/ /_/ / |/ / / / / / / / ]],
       [[/_/ |_/\___/\____/|___/_/_/ /_/ /_/ ]],
   },
  },
},	

	{
		"pojokcodeid/auto-lualine.nvim",
		opts = {
			setColor = "auto",
			setOption = "roundedall",
			setMode = 5,
		},
	},

	{
		"pojokcodeid/auto-conform.nvim",
		opts = {
			format_on_save = true,
			format_timeout_ms = 5000,
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, { "lua", "c" })
		end,
	},

	{
		"williamboman/mason.nvim",
		opts = { ensure_installed = { "stylua" } },
	},

  {
  "williamboman/mason-lspconfig.nvim",
  opts = function(_, opts)
    vim.list_extend(opts.skip_config, {})
    opts.virtual_text = true
    opts.ensure_installed = opts.ensure_installed or {}
    vim.list_extend(opts.ensure_installed, { "intelephense" })
  end,
},

	{
		"folke/which-key.nvim",
		opts = function(_, opts)
			opts.mappings = opts.mappings or {}
			vim.list_extend(opts.mappings, {
				{ "<leader>h", "<cmd>nohlsearch<CR>", desc = "󱪿 No Highlight", mode = "n" },
			})
		end,
	},

	{
		"nvim-telescope/telescope.nvim",
		opts = function(_, opts)
			opts.pickers = {
				find_files = {
					hidden = true,
				},

				live_grep = {
					theme = "dropdown",
					only_sort_text = true,
					additional_args = function()
						return { "--multiline" }
					end,
				},
			}
		end,
	},

	{
		"CRAG666/code_runner.nvim",
		opts = function(_, opts)
			vim.list_extend(opts.filetype, { go = "go run $fileName" })
		end,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = function(_, opts)
			-- set nvimtree float view (default left side)
			-- opts.view = {
			-- 	adaptive_size = false,
			-- 	centralize_selection = true,
			-- 	side = "left",
			-- 	preserve_window_proportions = false,
			-- 	number = false,
			-- 	relativenumber = false,
			-- 	signcolumn = "yes",
			-- 	float = {
			-- 		enable = true,
			-- 		open_win_config = function()
			-- 			local screen_w = vim.opt.columns:get()
			-- 			local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
			-- 			local window_w = screen_w * 0.5
			-- 			local window_h = screen_h * 0.9
			-- 			local window_w_int = math.floor(window_w)
			-- 			local window_h_int = math.floor(window_h)
			-- 			local center_x = (screen_w - window_w) / 2
			-- 			local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
			-- 			return {
			-- 				border = "rounded",
			-- 				relative = "editor",
			-- 				row = center_y,
			-- 				col = center_x,
			-- 				width = window_w_int,
			-- 				height = window_h_int,
			-- 			}
			-- 		end,
			-- 	},
			-- 	width = function()
			-- 		return math.floor(vim.opt.columns:get() * 0.5)
			-- 	end,
			-- }
			return opts
		end,
	},

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local lspconfig = require("lspconfig")

      local capabilities = vim.lsp.protocol.make_client_capabilities()

      lspconfig.emmet_ls.setup({
        capabilities = capabilities,
        filetypes = {
          "html", "css", "javascriptreact", "typescriptreact",
          "svelte", "vue", "blade", "php", "astro",
        },
      })
      lspconfig.intelephense.setup({
  capabilities = capabilities,
  filetypes = { "php", "blade" }, 
})
    end,
  },
}
