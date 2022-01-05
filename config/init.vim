" Set custom augroup
augroup user_events
	autocmd!
augroup END

" Initializes options
" 只能使用dein作为唯一包管理器
let s:package_manager = 'dein'

" Disable vim distribution plugins
let g:loaded_gzip = 1
let g:loaded_tar = 1
let g:loaded_tarPlugin = 1
let g:loaded_zip = 1
let g:loaded_zipPlugin = 1

let g:loaded_getscript = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_vimball = 1
let g:loaded_vimballPlugin = 1

let g:loaded_matchit = 1
let g:loaded_matchparen = 1
let g:loaded_2html_plugin = 1
let g:loaded_logiPat = 1
let g:loaded_rrhelper = 1

let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1

" Set main configuration directory as parent directory
let $VIM_PATH =
	\ get(g:, 'etc_vim_path',
	\   exists('*stdpath') ? stdpath('config') :
	\   ! empty($MYVIMRC) ? fnamemodify(expand($MYVIMRC, 1), ':h') :
	\   ! empty($VIM_PATH) ? expand($VIM_PATH, 1) :
	\   fnamemodify(resolve(expand('<sfile>:p')), ':h:h')
	\ )

" Enables 24-bit RGB color in the terminal
if has('termguicolors')
	if empty($COLORTERM) || $COLORTERM =~# 'truecolor\|24bit'
		set termguicolors
	endif
endif

if ! has('nvim')
	set t_Co=256
	" Set Vim-specific sequences for RGB colors
	" Fixes 'termguicolors' usage in vim+tmux
	" :h xterm-true-color
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

function! s:main()
	" 加载dein包管理器
endfunction

call s:main()
