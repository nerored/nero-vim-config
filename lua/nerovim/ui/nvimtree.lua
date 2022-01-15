local M = {}

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

	require 'nvim-tree'.setup {}
end

return M
