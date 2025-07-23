return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		{
			"mason-org/mason-lspconfig.nvim",
			opts = {
				ensure_installed = {
					"lua_ls",
				},
				automatic_installation = true,
				automatic_enable = true,
			},
		},
		{
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			opts = {
				auto_update = true,
				run_on_start = true
			}
		},
		{ "j-hui/fidget.nvim",    opts = {} },
		{
			"hrsh7th/nvim-cmp",
			dependencies = {
				{
					"L3MON4D3/LuaSnip",
					dependencies = {
						"saadparwaiz1/cmp_luasnip",
						"rafamadriz/friendly-snippets",
					},
				},
				"hrsh7th/cmp-nvim-lsp",
				{
					"folke/lazydev.nvim",
					ft = "lua",
					opts = {
						library = {
							{ path = "${3rd}/luv/library", words = { "vim" } }
						},
					},
				}
			},
			config = function()
				local cmp = require("cmp")
				cmp.setup({
					snippet = {
						expand = function(args)
							require("luasnip").lsp_expand(args.body)
						end,
					},
					window = {
						completion = cmp.config.window.bordered(),
						documentation = cmp.config.window.bordered(),
					},
					mapping = cmp.mapping.preset.insert({
						["<C-n>"] = cmp.mapping.select_next_item(),
						["<C-p>"] = cmp.mapping.select_prev_item(),
						["<C-b>"] = cmp.mapping.scroll_docs(-4),
						["<C-f>"] = cmp.mapping.scroll_docs(4),
						["<C-Space>"] = cmp.mapping.complete(),
						["<C-e>"] = cmp.mapping.abort(),
						["<CR>"] = cmp.mapping.confirm({ select = true }),
					}),
					sources = cmp.config.sources({
						{ name = "nvim_lsp" },
						{ name = "luasnip" },
						{ name = "buffer" },
						{ name = "lazydev", group_index = 0 },
					}),
				})
			end,
		},
	},
	config = function()
		local lsp = require("lspconfig")
		local cmp = require("cmp_nvim_lsp")
		local lspconfig = require("mason-lspconfig")
		require("luasnip.loaders.from_snipmate").lazy_load()
		require("luasnip.loaders.from_vscode").lazy_load()
		require("luasnip.loaders.from_lua").lazy_load()
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show Info" })
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
	end,
}
