 
-- is_vim_starting 判断vim是否第一次加载配置
function is_vim_starting()
	return vim.api.nvim_exec(
	[[
		echo has('vim_starting')
	]],true) == "1"
end
