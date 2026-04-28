-- scala
-- springboot

vim.pack.add {
	{
		src = "https://github.com/" .. "ThePrimeagen/harpoon",
		version = "harpoon2",
	},
}

local ok, harpoon = pcall(require, "harpoon")
if not ok then return end

harpoon.setup()

local toggle_list = function()
	harpoon.ui:toggle_quick_menu(harpoon:list(), {
		border = "rounded",
		title_pos = "center",
		ui_width_ratio = 0.50,
	})
end
local add_file = function() harpoon:list():add() end
local select_file = function(number)
	return function() harpoon:list():select(number) end
end

vim.keymap.set("n", "<leader>ha", add_file, { desc = "Harpoon Add File" })
vim.keymap.set("n", "<leader>ht", toggle_list, { desc = "Harpoon Toggle List" })
vim.keymap.set("n", "<A-1>", select_file(1), { desc = "Harpoon Buffer 1" })
vim.keymap.set("n", "<A-2>", select_file(2), { desc = "Harpoon Buffer 2" })
vim.keymap.set("n", "<A-3>", select_file(3), { desc = "Harpoon Buffer 3" })
vim.keymap.set("n", "<A-4>", select_file(4), { desc = "Harpoon Buffer 4" })
vim.keymap.set("n", "<A-5>", select_file(5), { desc = "Harpoon Buffer 5" })
vim.keymap.set("n", "<A-6>", select_file(6), { desc = "Harpoon Buffer 6" })
vim.keymap.set("n", "<A-7>", select_file(7), { desc = "Harpoon Buffer 7" })
vim.keymap.set("n", "<A-8>", select_file(8), { desc = "Harpoon Buffer 8" })
vim.keymap.set("n", "<A-9>", select_file(9), { desc = "Harpoon Buffer 9" })
vim.keymap.set("n", "<A-0>", select_file(0), { desc = "Harpoon Buffer 10" })
