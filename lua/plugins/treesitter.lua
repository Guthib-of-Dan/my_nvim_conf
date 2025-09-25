return {
				  {
            "nvim-treesitter/nvim-treesitter",
            branch = 'master',
            lazy = false,
            build = ":TSUpdate",
            config = function()
              vim.wo.foldmethod = 'expr'
              vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
            end
          }
}
