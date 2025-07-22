return {
	"folke/which-key.nvim",
	opts = {},
	event = "VeryLazy",
	keys = {
		{
			"<leader>.",
			function()
				require("which-key").show({ global = true })
			end,
			desc = "All Keymaps",
		},
	},
}
