local remote_url = "https://github.com/"
vim.pack.add {
	remote_url .. "https://github.com/utilyre/barbecue.nvim",
	remote_url .. "SmiteshP/nvim-navic",
	remote_url .. "nvim-tree/nvim-web-devicons",
}

require("barbecue").setup { attach_navic = false, show_navic = false }
