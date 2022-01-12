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
			require("nerovim.ui.dashboard").setup()
		end,
		--disable = not nerovim.builtin.dashboard.active
	}
}
