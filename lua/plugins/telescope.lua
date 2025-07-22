return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-telescope/telescope-ui-select.nvim",
	},
	config = function()
		require("telescope").setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})
		pcall(require("telescope").load_extension, "ui-select")
		pcall(require("telescope").load_extension, "fzf")
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Search Help Tags" })
		vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Search Keymaps" })
		vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Search Files" })
		vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Search Files in Git Repo" })
		vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "Search Finders" })
		vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "Search Strings" })
		vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Search Strings Live" })
		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Search Diagnostics" })
		vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = "Search Previously Open Files" })
		vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Search Open Buffers" })
		vim.keymap.set("n", "<leader>/", function()
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = true,
			}))
		end, { desc = "Search Current Buffer" })
	end,
}
