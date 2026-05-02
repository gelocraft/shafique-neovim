vim.pack.add { "https://github.com/" .. "mfussenegger/nvim-lint" }

local ok, lint = pcall(require, "lint")
if not ok then return end

lint.linters_by_ft = {
	lua = { "luacheck" },
	sh = { "shellcheck" },
	yaml = { "yamllint" },
	python = { "pylint" },
	java = { "checkstyle" },
	terraform = { "tflint" },
	javascript = { "eslint" },
	typescript = { "eslint" },
	javascriptreact = { "eslint" },
	typescriptreact = { "eslint" },
}

vim.api.nvim_create_autocmd(
	{ "BufReadPost", "BufNewFile", "ModeChanged", "BufWritePost" },
	{
		group = vim.api.nvim_create_augroup("PerformLinting", { clear = true }),
		callback = function()
			require("lint").try_lint(nil, { ignore_errors = true })
		end,
	}
)
