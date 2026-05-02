local remote_url = "https://github.com/"

vim.pack.add {
	remote_url .. "nvim-telescope/telescope.nvim",
}

local ok, telescope = pcall(require, "telescope")
if not ok then return end

vim.pack.add {
	remote_url .. "nvim-lua/plenary.nvim",
	remote_url .. "nvim-telescope/telescope-fzf-native.nvim",
	remote_url .. "nvim-telescope/telescope-ui-select.nvim",
}

telescope.setup {
	pickers = {
		buffers = {
			mappings = {
				n = {
					["dd"] = "delete_buffer",
				},
			},
		},
	},
	defaults = {
		dynamic_preview_title = true,
		layout_strategy = "vertical",
		layout_config = {
			height = 0.95,
			width = 0.95,
			vertical = {
				preview_cutoff = 20,
				prompt_position = "bottom",
			},
		},
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown(),
		},
	},
}

pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "ui-select")

local builtin = require "telescope.builtin"
vim.keymap.set(
	"n",
	"<leader>ps",
	function() builtin.grep_string { search = vim.fn.input "Grep > " } end
)

vim.keymap.set(
	"n",
	"<leader>pf",
	builtin.find_files,
	{ desc = "Find in all files" }
)

vim.keymap.set(
	"n",
	"<C-p>",
	builtin.git_files,
	{ desc = "Find git tracked files" }
)

vim.keymap.set(
	"n",
	"<leader>sh",
	builtin.help_tags,
	{ desc = "[S]earch [H]elp" }
)

vim.keymap.set(
	"n",
	"<leader>sk",
	builtin.keymaps,
	{ desc = "[S]earch [K]eymaps" }
)

vim.keymap.set(
	"n",
	"<leader>sf",
	builtin.find_files,
	{ desc = "[S]earch [F]iles" }
)

vim.keymap.set(
	"n",
	"<leader>ss",
	builtin.builtin,
	{ desc = "[S]earch [S]elect Telescope" }
)

vim.keymap.set(
	"n",
	"<leader>wu",
	builtin.lsp_references,
	{ desc = "[W]here [U]sed" }
)

vim.keymap.set(
	"n",
	"<leader>sw",
	builtin.grep_string,
	{ desc = "[S]earch current [W]ord" }
)

vim.keymap.set(
	"n",
	"<leader>sg",
	require "custom.telescope.live_grep",
	{ desc = "[S]earch by [G]rep" }
)

vim.keymap.set(
	"n",
	"<leader>sd",
	builtin.diagnostics,
	{ desc = "[S]earch [D]iagnostics" }
)

vim.keymap.set(
	"n",
	"<leader>sr",
	builtin.resume,
	{ desc = "[S]earch [R]esume" }
)

vim.keymap.set(
	"n",
	"<leader>s.",
	builtin.oldfiles,
	{ desc = "[S]earch Recent Files (\".\" for repeat)" }
)

vim.keymap.set(
	"n",
	"<leader><leader>",
	builtin.buffers,
	{ desc = "[ ] Find existing buffers" }
)

vim.keymap.set(
	"n",
	"<leader>/",
	function()
		builtin.current_buffer_fuzzy_find(
			require("telescope.themes").get_dropdown {
				winblend = 10,
				previewer = false,
			}
		)
	end,
	{ desc = "[/] Fuzzily search in current buffer" }
)

vim.keymap.set(
	"n",
	"<leader>s/",
	function()
		builtin.live_grep {
			grep_open_files = true,
			prompt_title = "Live Grep in Open Files",
		}
	end,
	{ desc = "[S]earch [/] in Open Files" }
)

vim.keymap.set(
	"n",
	"<leader>sn",
	function() builtin.find_files { cwd = vim.fn.stdpath "config" } end,
	{ desc = "[S]earch [N]eovim files" }
)
