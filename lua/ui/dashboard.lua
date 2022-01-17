local M = {}

local default_header = {
	[[      ___           ___           ___                                    ___     ]], 
	[[     /__/\         /  /\         /  /\          ___        ___          /__/\    ]],
	[[     \  \:\       /  /:/_       /  /::\        /__/\      /  /\        |  |::\   ]],
	[[      \  \:\     /  /:/ /\     /  /:/\:\       \  \:\    /  /:/        |  |:|:\  ]],
	[[  _____\__\:\   /  /:/ /:/_   /  /:/  \:\       \  \:\  /__/::\      __|__|:|\:\ ]],
	[[ /__/::::::::\ /__/:/ /:/ /\ /__/:/ \__\:\  ___  \__\:\ \__\/\:\__  /__/::::| \:\]],
	[[ \  \:\~~\~~\/ \  \:\/:/ /:/ \  \:\ /  /:/ /__/\ |  |:|    \  \:\/\ \  \:\~~\__\/]],
	[[  \  \:\  ~~~   \  \::/ /:/   \  \:\  /:/  \  \:\|  |:|     \__\::/  \  \:\      ]],
	[[   \  \:\        \  \:\/:/     \  \:\/:/    \  \:\__|:|     /__/:/    \  \:\     ]],
	[[    \  \:\        \  \::/       \  \::/      \__\::::/      \__\/      \  \:\    ]],
	[[     \__\/         \__\/         \__\/           ~~~~                   \__\/    ]],
}

local function read_header()
	local headerfile = vim.fn.stdpath("config") .. "/data/logo/header"

	if vim.fn.filereadable(headerfile) == 1 then
		return vim.fn.readfile(headerfile)
	end

	return default_header
end

local function pick_color()
	local colors = {"String", "Identifier", "Keyword", "Number"}
        return colors[math.random(#colors)]
end

local function footer()
	local total_plugins = #vim.tbl_keys(packer_plugins)
	local datetime = os.date(" %Y-%m-%d   %H:%M:%S")
	local version = vim.version()
	local nvim_version_info = 
		"   v" .. version.major .. "." .. version.minor .. "." .. version.patch

	return datetime .. 
		"  ❐ " .. total_plugins .. " plugins" .. 
		nvim_version_info .. " @ POWERED BY Nerored (`･ω･´)"
end

M.setup = function()
	read_header()
	local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

	dashboard.section.header.val = read_header()
        dashboard.section.header.opts.hl = "Marco"

	dashboard.section.footer.val = footer()
        dashboard.section.footer.opts.hl = "Number"

    	alpha.setup(dashboard.opts)

    	vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]])
end

return M
