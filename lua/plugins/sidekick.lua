return {
	"folke/sidekick.nvim",
	build = function()
		local result =
			vim.fn.system "curl -fsSL https://opencode.ai/install | bash"
		vim.cmd "startinsert"
		vim.env.PATH = vim.env.PATH
			.. ":"
			.. os.getenv "HOME"
			.. "/.opencode/bin/"
		if vim.v.shell_error ~= 0 then
			print("OpenCode install failed:\n" .. result)
		end
	end,
	opts = {
		cli = {
			mux = {
				backend = "tmux",
				enabled = true,
			},
		},
	},
	keys = {
		{
			"<tab>",
			function()
				-- if there is a next edit, jump to it, otherwise apply it if any
				if not require("sidekick").nes_jump_or_apply() then
					return "<Tab>" -- fallback to normal tab
				end
			end,
			expr = true,
			desc = "Goto/Apply Next Edit Suggestion",
		},
		{
			"<leader>aa",
			function()
				require("sidekick.cli").toggle { name = "opencode", focus = true }
			end,
			desc = "Sidekick Toggle OpenCode",
		},
		{
			"<leader>as",
			function() require("sidekick.cli").select() end,
			-- Or to select only installed tools:
			-- require("sidekick.cli").select({ filter = { installed = true } })
			desc = "Select CLI",
		},
		{
			"<leader>ad",
			function()
				require("sidekick.cli").send { msg = "{diagnostics_all}" }
			end,
			desc = "Fix All Diagnostics",
		},
		{
			"<leader>ab",
			function() require("sidekick.cli").send { msg = "{buffers}" } end,
			desc = "Send all opened buffers",
		},
		{
			"<leader>at",
			function() require("sidekick.cli").send { msg = "{this}" } end,
			mode = { "x", "n" },
			desc = "Send This",
		},
		{
			"<leader>af",
			function() require("sidekick.cli").send { msg = "{file}" } end,
			desc = "Send File",
		},
		{
			"<leader>av",
			function() require("sidekick.cli").send { msg = "{selection}" } end,
			mode = { "x" },
			desc = "Send Visual Selection",
		},
		{
			"<leader>ap",
			function() require("sidekick.cli").prompt() end,
			mode = { "n", "x" },
			desc = "Sidekick Select Prompt",
		},
		{
			"<leader>a.",
			function() require("sidekick.cli").focus() end,
			desc = "Sidekick Focus",
		},
	},
}
