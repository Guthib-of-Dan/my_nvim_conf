if vim.env.C ~= '0' then
  return {
    {
      "folke/tokyonight.nvim",
      lazy=false,
      priority = 1000,
      config = function()
        require("tokyonight").setup({ transparent = true })
        vim.cmd[[colorscheme tokyonight-night]]
      end
    }
  }
else 
  return {}
end
