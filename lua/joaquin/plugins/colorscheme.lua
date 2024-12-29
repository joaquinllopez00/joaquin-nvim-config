return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			transparent_background = true,
			term_colors = true,
			styles = {
				comments = { "italic" },
				functions = { "bold" },
				keywords = { "italic" },
			},
		})
		vim.cmd("colorscheme catppuccin")
	end,
}
