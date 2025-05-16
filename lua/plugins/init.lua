return {
	-- overidse dashboard
{
  "goolord/alpha-nvim",
  opts = {
    -- dash_model = {
    --   [[   _____             ______          __          ]],
    --   [[  / ___/____ _____  / ____/___  ____/ /__        ]],
    --   [[  \__ \/ __ `/ __ \/ /   / __ \/ __  / _ \       ]],
    --   [[ ___/ / /_/ / / / / /___/ /_/ / /_/ /  __/       ]],
    --   [[/____/\__/_/_/ /_/\____/\____/\__,_/\___/     ]],
    -- },
      dash_model = {
       [[    _   __                _             ]],
       [[   / | / /__  ____ _   __(_)___ ___    ]],
       [[  /  |/ / _ \/ __ \ | / / / __ `__ \  ]],
       [[ / /|  /  __/ /_/ / |/ / / / / / / / ]],
       [[/_/ |_/\___/\____/|___/_/_/ /_/ /_/ ]],
   },
  },
},	
	-- overide lualine
	{
		"pojokcodeid/auto-lualine.nvim",
		opts = {
			-- for more options check out https://github.com/pojokcodeid/auto-lualine.nvim
			setColor = "auto",
			setOption = "roundedall",
			setMode = 5,
		},
	},
	-- overide formatting
	{
		"pojokcodeid/auto-conform.nvim",
		opts = {
			format_on_save = true,
			format_timeout_ms = 5000,
		},
	},
	-- install treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, { "lua", "c" })
		end,
	},
	-- install mason (lsp, dap, linters, formatters)
	{
		"williamboman/mason.nvim",
		opts = { ensure_installed = { "stylua" } },
	},
	-- overide lsp config
	{
		"williamboman/mason-lspconfig.nvim",
		opts = function(_, opts)
			vim.list_extend(opts.skip_config, {})
			opts.virtual_text = true
		end,
	},
	-- add whichkey mappings
	{
		"folke/which-key.nvim",
		opts = function(_, opts)
			opts.mappings = opts.mappings or {}
			vim.list_extend(opts.mappings, {
				{ "<leader>h", "<cmd>nohlsearch<CR>", desc = "󱪿 No Highlight", mode = "n" },
			})
		end,
	},
	-- overide telescope
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
	-- add code runner
	{
		"CRAG666/code_runner.nvim",
		opts = function(_, opts)
			vim.list_extend(opts.filetype, { go = "go run $fileName" })
		end,
	},
	-- custem nvimtree
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
}
