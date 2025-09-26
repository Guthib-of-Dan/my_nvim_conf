if vim.env.C ~= '0' then
return {
				{
				"folke/tokyonight.nvim",
				lazy=false,
				priority = 1000,
				opts = {},
				config = function()
								vim.cmd[[colorscheme tokyonight-night]]
				end
				}
}
else 
  return {}
end
