return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = false,
	config = function()
		vim.keymap.set("n", "<leader>tt", ":Neotree toggle<CR>", { desc = "Toggle NeoTree" })
	end,
}
