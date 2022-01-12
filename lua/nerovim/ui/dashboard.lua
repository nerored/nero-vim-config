local M = {}

local logo = [[
⢸⣿⣿⣿⣿⣿⣿⠁⢰⣿⣶⣤⣀⠙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣼⣿⣿⣿⣿⣿⣿⠿⢿⣿⣿⣿⣿⣿⡿⠋⣁⣤⣤⣶⣿⣶⠀⠻⣿⣿⣿⣿⠀⠀⠀
⢸⣿⣿⣿⣿⣿⣿⠀⣼⣿⠀⢹⡿⣷⠀⠻⣾⣿⣿⣿⢿⠿⠻⠽⢻⣿⠿⢠⢠⢴⣶⠀⠀⠀⠀⠈⣄⣴⣿⣿⡿⣿⡇⠀⣿⣿⡀⢹⣿⣿⣿⠀⠀⠀
⢸⣿⣿⣿⣿⣿⣿⠀⣿⣿⠀⢸⣿⡿⣿⣶⠉⠸⢠⠼⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢼⢠⣙⣅⣰⡿⣿⣷⠀⣿⣿⣿⠀⠀⠀
⢸⣿⣿⣿⣿⣿⡿⠀⣿⡿⣿⣿⠛⠀⠀⠘⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠨⠈⣿⣿⡏⠀⣾⣿⣿⠀⠀⠀
⢸⣿⣿⣿⣿⣿⡧⢠⣿⠩⠀⠀⠠⠀⠀⠀⠀⠀⠀⠀⠀⢨⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠈⢨⢈⢿⣠⣿⣿⣿⠀⠀⠀
⢸⣿⣿⣿⣿⣿⣿⣴⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣶⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⢤⠈⢿⣿⣿⠀⠀⠀
⢸⣿⣿⣿⣿⢿⠠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⡿⣿⣿⣿⣿⣿⣿⣤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⢈⣿⠀⠀⠀
⢸⣿⣽⢬⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠿⠛⠛⠛⠻⢿⣿⣿⣿⣿⣿⣿⠧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢨⠀⠀⠀
⢸⡨⠘⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿⣿⣿⣷⣈⢿⠟⣠⣾⣿⣿⣤⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀
⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢠⣼⣿⣿⣿⣿⠟⠙⠛⣿⡄⣸⣿⣿⣿⣿⣿⣿⠛⠛⣿⡆⣤⣀⠀⠀⠀⠀⣠⠀⠀⠀
⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡄⣾⣶⣾⣿⣿⣿⣿⣿⣀⠀⣀⣿⡇⡿⣿⣿⣿⣿⣿⣧⠀⠀⣼⣿⢸⣿⣧⣄⠀⢠⣾⠀⠀⠀
⢸⢠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣼⣿⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢀⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⠋⣾⣿⣿⣿⢀⣿⣿⠀⠀⠀
⢸⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠿⠿⢿⣿⣿⣈⠿⣿⣿⣿⣿⣿⠿⠛⣩⣴⣿⣿⣌⠻⣿⣿⣿⣿⡿⠛⠡⠿⠿⠛⠛⠛⠈⣿⣿⠀⠀⠀
⢸⣴⣶⣀⡀⢀⠀⠀⣿⣿⣿⣿⣿⠋⢠⣠⣴⣴⣸⢈⢶⣶⠶⠤⠀⠀⢀⣾⣿⣿⣿⣿⣿⢻⣿⣿⣿⣿⠀⠒⠻⠿⠿⠁⠤⢠⠀⠀⠛⣿⣿⠀⠀⠀
⢸⣿⣿⣿⣿⣿⣶⠀⠿⠿⠛⢋⠀⣀⣠⣠⣤⣴⣴⣴⠤⠛⢋⣡⣶⣀⠸⣿⣿⣿⣿⠿⣁⣄⠛⠿⠿⠛⣠⣿⣶⡈⠀⢰⣠⣴⣤⣀⠀⣹⣿⠀⠀⠀
⢸⣿⣿⣿⣿⣴⣶⠿⠸⣿⣿⣿⠀⠀⠀⠀⠘⠈⣠⣤⣴⣿⣿⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⢠⣤⣀⠘⢼⠀⢸⣿⣿⠀⠀⠀
⢸⣿⣿⢛⣴⣿⣿⣼⠰⠙⣿⣿⠷⢀⣠⢴⣸⠀⠠⢀⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣤⣀⠀⣀⡴⢀⠛⣿⣿⠀⠀⠀
⢸⢋⣾⣿⣦⢻⣼⣼⣧⠛⠀⠰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢉⣼⣾⣿⣿⣬⠀⠀⠀
⠠⢿⣼⣼⣼⣷⡙⢛⣴⣶⠙⣿⣦⠙⢿⣿⣿⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿⣿⣿⣿⣿⣿⣿⡿⣿⣿⣿⣿⠿⠋⠠⠾⠿⡿⣿⣿⣿⣿⠀⠀⠀
⢸⣿⣿⣦⠙⣥⣿⣦⢿⣼⣼⣶⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠙⠻⠿⠿⠉⠀⠀⠀⠀⠀⢀⡿⣿⣿⣿⣿⠀⠀⠀
⢸⣼⡿⣡⣿⣦⢻⣼⣷⠹⠟⠀⠀⠀⠙⣦⠀⠀⠀⠀⠐⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⠖⠉⠀⠘⣿⣿⣿⣿⣿⠀⠀⠀



]]

local function pick_color()
	local colors = {"String", "Identifier", "Keyword", "Number"}
        return colors[math.random(#colors)]
end

local function footer()
	local total_plugins = #vim.tbl_keys(packer_plugins)
	local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
	local version = vim.version()
	local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch

	return datetime .. "   " .. total_plugins .. " plugins" .. nvim_version_info
end

M.setup = function()
	print("setting dashboard")

	local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

	dashboard.section.header.val = logo
        --dashboard.section.header.opts.hl = pick_color()

	dashboard.section.footer.val = footer()
        dashboard.section.footer.opts.hl = "Constant"

        alpha.setup(dashboard.opts)

        vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]])
end

return M
