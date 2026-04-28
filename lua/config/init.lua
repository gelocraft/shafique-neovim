require "config.options"
require "config.keymaps"
require "config.autocmds"
require "config.diagnostic"

if vim.version.ge(vim.version(), { 0, 12, 0 }) then
	require "config.vim-pack"
else
	require "config.lazy"
end
