vim.pack.add { "https://github.com/hat0uma/csvview.nvim" }

require("csvview").setup {
	view = { display_mode = "border" },
	parser = {
		delimiter = {
			ft = {
				csv = ",", -- Always use comma for .csv files
				tsv = "\t", -- Always use tab for .tsv files
			},
			fallbacks = { -- Try these delimiters in order for other files
				",", -- Comma (most common)
				"\t", -- Tab
				";", -- Semicolon
				"|", -- Pipe
				":", -- Colon
				" ", -- Space
			},
		},
	},
}

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "csv", "tsv" },
	callback = function(args) require("csvview").enable(args.buf) end,
})
