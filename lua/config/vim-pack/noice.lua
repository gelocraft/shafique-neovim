vim.pack.add { "https://github.com/" .. "folke/noice.nvim" }

local ok, noice = pcall(require, "noice")
if not ok then return end

vim.pack.add { "https://github.com/" .. "MunifTanjim/nui.nvim" }

noice.setup {
	popupmenu = { enabled = false },
	health = { checker = false },
	notify = { enabled = false },
	messages = { enabled = false },
	smart_move = { enabled = false },
	lsp = {
		progress = { enabled = false },
		message = { enabled = false },
		hover = { enabled = true, silent = true },
		signature = { enabled = false },
	},
	presets = {
		bottom_search = false, -- use a classic bottom cmdline for search
		command_palette = true, -- position the cmdline and popupmenu together
		long_message_to_split = true, -- long messages will be sent to a split
		inc_rename = false, -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = true, -- add a border to hover docs and signature help
	},
}
