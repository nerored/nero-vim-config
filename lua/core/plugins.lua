-- 必须的插件列表集合
return {
	-- packer
	{
		'wbthomason/packer.nvim'
	},
	-- UI
	{
		'goolord/alpha-nvim',
		event = "BufWinEnter",
		config = function()
			require("ui.dashboard").setup()
		end,
		--disable = not nerovim.builtin.dashboard.active
	},
	{
		'kyazdani42/nvim-tree.lua',
    		requires = {
      			'kyazdani42/nvim-web-devicons',
    		},
    		config = function() 
			require("ui.nvimtree").setup()
		end,
	},
	{
		'simrat39/symbols-outline.nvim',
		config = function()
			require("ui.nvimtree").setup()
		end,
	},
	{
		'romgrk/barbar.nvim',
  		requires = {
			'kyazdani42/nvim-web-devicons'
		},
		event = "BufWinEnter",
	},
	{
    		"nvim-lualine/lualine.nvim",
    		config = function()
      			require("ui.lualine").setup()
    		end,
	},

}
