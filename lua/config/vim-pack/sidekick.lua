local remote_url = "https://github.com/"
vim.pack.add {
	remote_url .. "folke/sidekick.nvim",
	remote_url .. "github/copilot.vim",
}

local ok, sidekick = pcall(require, "sidekick")
if not ok then return end

sidekick.setup { cli = { mux = { backend = "tmux", enabled = true } } }

local cli = require "sidekick.cli"

vim.keymap.set(
	"n",
	"<leader>aa",
	function() cli.toggle { name = "opencode", focus = true } end,
	{ desc = "Sidekick Toggle OpenCode" }
)

vim.keymap.set(
	"n",
	"<leader>as",
	function() cli.select() end,
	{ desc = "Select CLI" }
)

vim.keymap.set(
	"n",
	"<leader>ad",
	function() cli.send { msg = "{diagnostics_all}" } end,
	{ desc = "Fix All Diagnostics" }
)

vim.keymap.set(
	"n",
	"<leader>ab",
	function() cli.send { msg = "{buffers}" } end,
	{ desc = "Send all opened buffers" }
)

vim.keymap.set(
	{ "n", "x" },
	"<leader>at",
	function() cli.send { msg = "{this}" } end,
	{ desc = "Send This" }
)

vim.keymap.set(
	"n",
	"<leader>af",
	function() cli.send { msg = "{file}" } end,
	{ desc = "Send File" }
)

vim.keymap.set(
	"x",
	"<leader>av",
	function() cli.send { msg = "{selection}" } end,
	{ desc = "Send Visual Selection" }
)

vim.keymap.set(
	{ "n", "x" },
	"<leader>ap",
	function() cli.prompt() end,
	{ desc = "Sidekick Select Prompt" }
)

vim.keymap.set(
	"n",
	"<leader>a.",
	function() cli.focus() end,
	{ desc = "Sidekick Focus" }
)
