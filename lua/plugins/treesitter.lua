return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		})
	end,
}
