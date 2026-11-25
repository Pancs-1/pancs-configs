local function enable_transparency()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
end

local function fix_colors()
    vim.api.nvim_set_hl(0, "SnacksIndent", { fg = "#2a2e38" })
    vim.api.nvim_set_hl(0, "SnacksIndentScope", { fg = "#b48ead" }) -- Bright purple glow
end

return {
    {
	"ficcdaf/ashen.nvim",
	tag = "*",
	lazy = false,
	priority = 999,
	opts = {
	    -- plugin options
	},
	config = function(_, opts)
	    require("ashen").setup(opts)
            vim.cmd.colorscheme("ashen")
            enable_transparency()
	    fix_colors()
        end,
    },
    {
	"nvim-lualine/lualine.nvim",
	dependencies = {
	    "nvim-tree/nvim-web-devicons",
	},
	opts = {
	    theme = 'ashen'
	}
    }
}

