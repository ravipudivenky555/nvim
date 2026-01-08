return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			format_on_save = {
				lsp_format = "fallback",
			},
		})
		vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, { desc = "Format current Buffer" })
		vim.keymap.set("v", "<leader>ff", vim.lsp.buf.format, { desc = "Format current Buffer" })
	end,
}
