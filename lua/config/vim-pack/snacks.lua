vim.pack.add { "https://github.com/" .. "folke/snacks.nvim" }

local ok, snacks = pcall(require, "snacks")
if not ok then return end

snacks.setup {
	indent = {},
	lazygit = {},
	quickfile = {},
}

vim.keymap.set(
	"n",
	"<leader>lg",
	"<cmd>lua Snacks.lazygit()<cr>",
	{ desc = "[L]azy [G]it" }
)
