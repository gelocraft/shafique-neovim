local remote_url = "https://github.com/"
vim.pack.add {
	{
		src = remote_url .. "nvim-neo-tree/neo-tree.nvim",
		version = vim.version.range "3",
	},
}

local ok, neotree = pcall(require, "neo-tree")
if not ok then return end

vim.pack.add {
	remote_url .. "nvim-lua/plenary.nvim",
	remote_url .. "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	remote_url .. "MunifTanjim/nui.nvim",
}
