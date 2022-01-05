-- 配置启动文件,做一些初始化相关事情，以及加载插件包管理器

local clear_user_autocmd = function()
	vim.api.nvim_exec(
	[[
		augroup user_events
			autocmd!
		augroup end
	]])
end

local disable_distribution_plugins = function()
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

local init_leader_map = function()
	vim.g.mapleader = ","
	vim.g.maplocalleader = ";"
end

init_leader_map()
