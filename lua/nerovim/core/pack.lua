-- packer plugin manager 使用packer作为插件管理器
-- https://github.com/wbthomason/packer.nvim.git
-- 默认安装在$Dat_PATH/site/pack/packer/start/packer.nvim

local plugins = setmetatable({},{
})

local packer_url = 'https://github.com/wbthomason/packer.nvim' 

function plugins:init()
	local install_path = vim.fn.stdpath("data") .. "site/pack/packer/start/packer.nvim"
	if vim.fn.isdirectory(install_path) == 0 then
		vim.fn.system("git","clone","--depth 1",packer_url,install_path)
	end

	local ok,packer = pcall(require,"packer")
	
	if not ok then
		--TODO::check packer errorinfo
	end

	packer.init({
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
    		},
	)

	-- 加载配置列表

	return self
end

return plugins
