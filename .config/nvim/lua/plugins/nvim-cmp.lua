return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",     -- LSP completions
      "hrsh7th/cmp-buffer",       -- Words from current buffer
      "hrsh7th/cmp-path",         -- File system paths
      "L3MON4D3/LuaSnip",         -- Snippet engine
      "saadparwaiz1/cmp_luasnip", -- Snippet completions
      "rafamadriz/friendly-snippets", -- Large collection of snippets (C++, Python, Lua, etc.)
      "onsails/lspkind.nvim",     -- VS Code-style icons and source labels in menu
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")

      -- Load VS Code-style snippets from friendly-snippets
      require("luasnip.loaders.from_vscode").lazy_load()

	    cmp.setup({
		snippet = {
		    expand = function(args)
			luasnip.lsp_expand(args.body)
		    end,
		},
		window = {
		    completion = cmp.config.window.bordered(),
		    documentation = cmp.config.window.bordered(),
		},
		mapping = cmp.mapping.preset.insert({
		    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
		    ["<C-f>"] = cmp.mapping.scroll_docs(4),
		    ["<C-Space>"] = cmp.mapping.complete(),
		    ["<C-e>"] = cmp.mapping.abort(),
		    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Enter to confirm
		    ["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
			    cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
			    luasnip.expand_or_jump()
			else
			    fallback()
			end
		    end, { "i", "s" }),
		    ["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
			    cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
			    luasnip.jump(-1)
			else
			    fallback()
			end
		    end, { "i", "s" }),
		}),
		sources = cmp.config.sources({
		    { name = "nvim_lsp" }, -- Priority 1: Language Server
		    { name = "luasnip" },  -- Priority 2: Snippets
		    { name = "buffer" },   -- Priority 3: Buffer words
		    { name = "path" },     -- Priority 4: File paths
		}),
		formatting = {
		    format = lspkind.cmp_format({
			mode = "symbol_text",
			maxwidth = 50,
			ellipsis_char = "...",
			menu = {
			    nvim_lsp = "[LSP]",
			    luasnip = "[Snippet]",
			    buffer = "[Buffer]",
			    path = "[Path]",
			},
		    }),
		},
	    })
	end,
    },
}

