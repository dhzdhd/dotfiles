return {
	-- Bottom line bar
	{
		"itchyny/lightline.vim",
		config = function()
			vim.g.lightline = {
				colorscheme = "tokyonight",
				transparent = true,
			}
		end,
	},

	-- Buffer line
	{
		'akinsho/bufferline.nvim',
		version = "*",
		dependencies = 'nvim-tree/nvim-web-devicons'
	},

	-- Sidebar file browser
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			"3rd/image.nvim",
		},
		config = function()
			vim.keymap.set(
				"n",
				"sfb",
				":Neotree reveal<CR>",
				{ noremap = true }
			)
		end,
	},

	-- Popup file browser
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			vim.keymap.set(
				"n",
				"pfb",
				":Telescope file_browser<CR>",
				{ noremap = true }
			)

			require("telescope").setup {
				extensions = {
					file_browser = {
						theme = "ivy",
						hijack_netrw = true,
						mappings = {
							["i"] = {
							},
							["n"] = {
							},
						},
					},
				},
			}

			require("telescope").load_extension "file_browser"
		end,
	},
}
