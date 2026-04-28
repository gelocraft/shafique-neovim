local remote_url = "https://github.com/"
vim.pack.add {
	{ src = remote_url .. "stevearc/oil.nvim" },
	{ src = remote_url .. "nvim-tree/nvim-web-devicons" },
}

local ok, oil = pcall(require, "oil")
if not ok then return end

oil.setup {
	view_options = { show_hidden = true },
	default_file_explorer = false,
	use_default_keymaps = false,
	keymaps = {
		["?"] = "actions.show_help",
		["q"] = "actions.close",
		["-"] = "actions.parent",
		["_"] = "actions.open_cwd",
		["<cr>"] = "actions.select",
	},
}

vim.keymap.set("n", "<leader>e", "<cmd>Oil<cr>", { desc = "File Explorer" })
