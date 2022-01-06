-- packer plugin manager 使用packer作为插件管理器
-- https://github.com/wbthomason/packer.nvim.git
-- 默认安装在$Dat_PATH/site/pack/packer/start/packer.nvim

local packer = setmetatable({},{
})

local packer_url = 'https://github.com/wbthomason/packer.nvim' 

function packer:init()
	local install_path = os.getenv("DAT_PATH") .. "site/pack/packer/start/packer.nvim"
	if vim.fn.isdirectory(install_path) == 0 then
		local output = vim.api.nvim_exec(
			string.format('!git clone --depth 1 %s %s',packer_url,install_path),
		true)

		if string.len(output) > 0 then
			print("err:" .. output)
			print("please restart and try again")
		end
	end
	return self
end

return packer
