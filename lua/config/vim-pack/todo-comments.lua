local remote_url = "https://github.com/"
vim.pack.add {
	remote_url .. "folke/todo-comments.nvim",
	remote_url .. "nvim-lua/plenary.nvim",
}

require("todo-comments").setup { signs = false }
