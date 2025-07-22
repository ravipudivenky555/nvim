return {
	"andrewberty/telescope-themes",
	config = function()
		require("telescope").load_extension("themes")
		vim.keymap.set("n", "<leader>th", ":Telescope themes<CR>", { desc = "Select themes", silent = true })
	end,
}
