-- 配置启动文件,做一些初始化相关事情，以及加载插件包管理器
require("core.utils")

local function clear_user_autocmd()
	vim.api.nvim_exec(
	[[
		augroup user_events
			autocmd!
		augroup end
	]],false)
end

local function disable_distribution_plugins()
   	 vim.g.loaded_gtags = 1
   	 vim.g.loaded_gzip = 1
   	 vim.g.loaded_tar = 1
   	 vim.g.loaded_tarPlugin = 1
   	 vim.g.loaded_zip = 1
   	 vim.g.loaded_zipPlugin = 1
   	 vim.g.loaded_getscript = 1
   	 vim.g.loaded_getscriptPlugin = 1
   	 vim.g.loaded_vimball = 1
   	 vim.g.loaded_vimballPlugin = 1
   	 vim.g.loaded_matchit = 1
   	 vim.g.loaded_matchparen = 1
   	 vim.g.loaded_2html_plugin = 1
   	 vim.g.loaded_logiPat = 1
   	 vim.g.loaded_rrhelper = 1
   	 vim.g.loaded_netrw = 1
   	 vim.g.loaded_netrwPlugin = 1
   	 vim.g.loaded_netrwSettings = 1
   	 vim.g.loaded_netrwFileHandlers = 1
end

local function init_leader_map_and_resetmap()
	vim.g.mapleader = ","
	vim.g.maplocalleader = ";"
	vim.api.nvim_set_keymap("n"," ","",{noremap = true})
	vim.api.nvim_set_keymap("x"," ","",{noremap = true})
end

local function main()
	if is_vim_starting() then 
		clear_user_autocmd()
		disable_distribution_plugins()
		init_leader_map_and_resetmap()
	end

	-- default mappings
	-- require("editor.keymappings").load_defaults()

	-- load packer to managment plugins
	local packer = require("core.pack"):init()
end

main()
