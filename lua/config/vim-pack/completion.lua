local remote_url = "https://github.com/"

vim.pack.add { remote_url .. "hrsh7th/nvim-cmp" }

local ok, cmp = pcall(require, "cmp")
if not ok then return end

vim.pack.add {
	remote_url .. "L3MON4D3/LuaSnip",
	remote_url .. "saadparwaiz1/cmp_luasnip",
	remote_url .. "hrsh7th/cmp-nvim-lsp",
	remote_url .. "hrsh7th/cmp-buffer",
	remote_url .. "hrsh7th/cmp-path",
}

local luasnip = require "luasnip"
luasnip.config.setup {}

cmp.setup {
	snippet = {
		expand = function(args) luasnip.lsp_expand(args.body) end,
	},
	completion = { completeopt = "menu,menuone,noinsert" },
	mapping = cmp.mapping.preset.insert {
		-- Select the [n]ext item
		["<C-n>"] = cmp.mapping.select_next_item(),
		-- Select the [p]revious item
		["<C-p>"] = cmp.mapping.select_prev_item(),

		-- Scroll the documentation window [b]ack / [f]orward
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),

		["<C-y>"] = cmp.mapping.confirm { select = true },
		["<Enter>"] = cmp.mapping.confirm { select = true },

		["<C-Space>"] = cmp.mapping.complete {},

		["<C-l>"] = cmp.mapping(function()
			if luasnip.expand_or_locally_jumpable() then
				luasnip.expand_or_jump()
			end
		end, { "i", "s" }),
		["<C-h>"] = cmp.mapping(function()
			if luasnip.locally_jumpable(-1) then luasnip.jump(-1) end
		end, { "i", "s" }),
	},
	sources = {
		{ name = "lazydev", group_index = 0 },
		{ name = "buffer" },
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "path" },
	},
}
