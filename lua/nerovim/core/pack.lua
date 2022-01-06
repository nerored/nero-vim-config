-- packer plugin manager 使用packer作为插件管理器
-- https://github.com/wbthomason/packer.nvim.git
-- 默认安装在$Dat_PATH/site/pack/packer/start/packer.nvim

local packer = setmetatable({},{
})

function packer:init()
	print("find packer file or clone it")
	local install_path = os.getenv("DAT_PATH") .. "site/pack/packer/start/packer.nvim"
	print(install_path)
	if vim.fn.filereadable(install_path) == 1 then
		print("packer is installed")
	else
		print("packer is not installed")
		local install_cmd = '!git clone --depth 1 https://github.com/wbthomason/packer.nvim ' .. install_path
		print(vim.api.nvim_command(install_cmd))
	end
	return self
end

return packer
