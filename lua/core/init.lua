-- 配置启动文件,做一些初始化相关事情，以及加载插件包管理器
require("utils")

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
	print("config core start")
	if is_vim_starting() then 
		print("is first start")
		clear_user_autocmd()
		disable_distribution_plugins()
		init_leader_map_and_resetmap()
	end

	vim.env.VIM_PATH =
		vim.fn.fnamemodify(vim.fn.resolve(vim.fn.expand('<sfile>:p')),":h:h")

	print("set VIM_PATH ",os.getenv("VIM_PATH"))

	-- load packer to managment plugins
end

main()
