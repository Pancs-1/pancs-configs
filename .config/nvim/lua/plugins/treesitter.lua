return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    local ts = require('nvim-treesitter')
    
    ts.install({
      "cpp",
      "css",
      "gitignore",
      "html",
      "javascript",
      "json",
      "lua",
      "python",
      "zsh",
      "c",
      "c_sharp"
    })

    vim.api.nvim_create_autocmd('FileType', {
	callback = function()
	    pcall(vim.treesitter.start)
	    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
    })
end
}

