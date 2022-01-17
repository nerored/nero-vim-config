-- packer plugin manager 使用packer作为插件管理器
-- https://github.com/wbthomason/packer.nvim.git
-- 默认安装在$Dat_PATH/site/pack/packer/start/packer.nvim

local plugins = setmetatable({},{
})

local packer_url = 'https://github.com/wbthomason/packer.nvim' 

-- 首次初始化时使用
function plugins:init()
	local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if vim.fn.isdirectory(install_path) == 0 then
		local a = vim.fn.system {"git","clone","--depth", "1",packer_url,install_path}
	end

	-- load packer mod
	vim.cmd [[packadd packer.nvim]]

	local ok,packer = pcall(require,"packer")
	
	if not ok then
		--TODO::check packer errorinfo
		print("packer not ok")
		return
	end

	packer.init {
		package_root = package_root,
    		compile_path = compile_path,
    		git = {
      			clone_timeout = 300,
      			subcommands = {
        			-- this is more efficient than what Packer is using
        			fetch = "fetch --no-tags --no-recurse-submodules --update-shallow --progress",
      			},
    		},
    		max_jobs = 50,
    	}

	-- 加载配置列表
	-- mustld plugins
	local mustld_plugins = require "core.plugins"
	packer.startup(function(use)
		for _,item in pairs(mustld_plugins) do
			use(item)
		end
	end)
	-- option plugins
	-- custom plugins

	return self
end

-- 重载时使用
function plugins:reload()
	local ok,packer = pcall(require,"packer")

	if not ok then
		print("packer not ok")
		return
	end

	packer.reset()
end

return plugins
