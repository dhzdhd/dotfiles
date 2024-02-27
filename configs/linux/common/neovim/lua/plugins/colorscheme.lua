return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			style = "moon",
			transparent = true,
		},
		--	init = function()
		--		require("tokyonight").setup({
		--			transparent = true,
		--		})
		--	end,
		config = function()
			vim.cmd([[colorscheme tokyonight-moon]])
		end
	},

}
