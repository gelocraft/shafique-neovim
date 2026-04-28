vim.pack.add {
	{ src = "https://github.com/scalameta/nvim-metals" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
}

-- Build step (MetalsInstall)
if vim.fn.executable "cs" == 1 then vim.cmd "MetalsInstall" end

-- Setup
local metals_config = require("metals").bare_config()

metals_config.on_attach = function(client, bufnr)
	-- your on_attach function
end

-- FileType autocommand (replaces ft + config)
local nvim_metals_group =
	vim.api.nvim_create_augroup("nvim-metals", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "scala", "sbt", "java" },
	callback = function() require("metals").initialize_or_attach(metals_config) end,
	group = nvim_metals_group,
})
