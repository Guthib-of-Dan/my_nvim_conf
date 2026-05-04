return {
				  {
            "nvim-treesitter/nvim-treesitter",
            branch = 'main',
            lazy = false,
            build = ":TSUpdate",
            config = function()
              vim.wo[0][0].foldmethod = 'expr'
              vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
            end
          }
}
