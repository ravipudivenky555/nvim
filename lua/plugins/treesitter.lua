return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		require("nvim-treesitter.config").setup({
			sync_install = false,
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false
			}
		})
	end
}
