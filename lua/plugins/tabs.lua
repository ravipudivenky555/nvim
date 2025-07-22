return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	init = function()
		vim.g.barbar_auto_setup = false
		local map = vim.keymap.set
		map("n", "<A-j>", ":BufferPrevious<CR>", { desc = "Previous Buffer" })
		map("n", "<A-k>", ":BufferNext<CR>", { desc = "Next Buffer" })
		map("n", "<A-c>", ":BufferClose<CR>", { desc = "Close Current Buffer" })
		-- Sort automatically by...
		map("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", { desc = "Order Buffers by Buffer Numbers" })
		map("n", "<Space>bn", "<Cmd>BufferOrderByName<CR>", { desc = "Order Buffers by Buffer Names" })
		map("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", { desc = "Order Buffers by Buffer Directories" })
		map("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", { desc = "Order Buffers by Buffer Languages" })
		map("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", { desc = "Order Buffers by Buffer Window Numbers" })
	end,
	opts = {
		animation = true,
		clickable = true,
		icons = {
			diagnostics = {},
			filetype = {
				enabled = true,
				custom_colors = false,
			},
			preset = "powerline",
		},
		sidebar_filetypes = { ["neo-tree"] = true },
		sort = {
			ignore_case = true,
		},
	},
}
