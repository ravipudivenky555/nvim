vim.g.mapleader = " "
vim.g.maploacalleader = "."
require("config.lazy")
require("current-theme")
require("vim_opts")
require("keymaps")
vim.cmd("TSUpdate")
