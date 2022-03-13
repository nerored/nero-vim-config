local M = {}

local tree_cb = require'nvim-tree.config'.nvim_tree_callback
local mappings = {
	{ key = {"<2-RightMouse>", "<C-]>"},    	cb = tree_cb("cd") },
	{ key = "<C-t>",                        	cb = tree_cb("tabnew") },
	{ key = "<",                            	cb = tree_cb("prev_sibling") },
	{ key = ">",                            	cb = tree_cb("next_sibling") },
	{ key = "P",                            	cb = tree_cb("parent_node") },
	{ key = "<Tab>",                        	cb = tree_cb("preview") },
	{ key = "K",                            	cb = tree_cb("first_sibling") },
	{ key = "J",                            	cb = tree_cb("last_sibling") },
	{ key = "I",                            	cb = tree_cb("toggle_ignored") },
	{ key = "H",                            	cb = tree_cb("toggle_dotfiles") },
	{ key = "R",                            	cb = tree_cb("refresh") },
	{ key = "a",                            	cb = tree_cb("create") },
	{ key = "d",                            	cb = tree_cb("remove") },
	{ key = "D",                            	cb = tree_cb("trash") },
	{ key = "r",                            	cb = tree_cb("rename") },
	{ key = "<C-r>",                        	cb = tree_cb("full_rename") },
	{ key = "x",                            	cb = tree_cb("cut") },
	{ key = "c",                            	cb = tree_cb("copy") },
	{ key = "p",                            	cb = tree_cb("paste") },
	{ key = "y",                            	cb = tree_cb("copy_name") },
	{ key = "Y",                            	cb = tree_cb("copy_path") },
	{ key = "gy",                           	cb = tree_cb("copy_absolute_path") },
	{ key = "[c",                           	cb = tree_cb("prev_git_item") },
	{ key = "]c",                           	cb = tree_cb("next_git_item") },
	{ key = "-",                            	cb = tree_cb("dir_up") },
	{ key = "s",                            	cb = tree_cb("system_open") },
	{ key = "q",                            	cb = tree_cb("close") },
	{ key = "g?",                           	cb = tree_cb("toggle_help") },
	{ key = { "l", "<CR>", "o" ,"<2-LeftMouse>"},   cb = tree_cb "edit" },
	{ key = { "h", "<BS>"},                 	cb = tree_cb "close_node" },
	{ key = "v",                                    cb = tree_cb "vsplit" },
	{ key = "V",                        		cb = tree_cb("split") },
}

local function config()
	return {
		disable_netrw       = true,
  		hijack_netrw        = true,
  		open_on_setup       = false,
  		ignore_ft_on_setup  = {
        		"alpha",
		},
  		auto_close          = false,
  		open_on_tab         = false,
  		hijack_cursor       = false,
  		update_cwd          = false,
  		update_to_buf_dir   = {
    			enable = true,
    			auto_open = true,
  		},
  		diagnostics = {
    			enable = false,
    			icons = {
      				hint = "",
      				info = "",
      				warning = "",
      				error = "",
    			}
  		},
 		update_focused_file = {
 		   	enable      = false,
 		   	update_cwd  = false,
 		   	ignore_list = {}
 		},
  		system_open = {
    			cmd  = nil,
    			args = {}
  		},
  		filters = {
    			dotfiles = false,
    			custom = {}
  		},
  		git = {
    			enable = true,
    			ignore = true,
    			timeout = 500,
  		},
  		view = {
    			width = 30,
    			height = 30,
    			hide_root_folder = false,
    			side = 'left',
    			auto_resize = false,
    			mappings = {
      				custom_only = false,
      				list = mappings,
    			},
    			number = false,
    			relativenumber = false,
    			signcolumn = "yes"
  		},
  		trash = {
    			cmd = "trash",
    			require_confirm = true
  		}
	}
end


local function on_open()
	require'bufferline.state'.set_offset(31, '')
   	require'nvim-tree'.find_file(true)
end

local function on_close()
	require'bufferline.state'.set_offset(0)
   	require'nvim-tree'.close()
end

M.setup = function()
 	local tree_view = require "nvim-tree.view"
  	local default_open = tree_view.open
  	local default_close = tree_view.close

	tree_view.open = function()
    		on_open()
    		default_open()
  	end

  	tree_view.close = function()
    		on_close()
    		default_close()
  	end

	require 'nvim-tree'.setup(config())
end

return M
