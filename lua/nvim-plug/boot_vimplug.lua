local vimplugfile = vim.fn.stdpath('data') .. '/site/autoload/plug.vim'
local vimplugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
if vim.fn.filereadable(vimplugfile) == 0 then
	vim.fn.system(string.format('curl -fsSLo %s --create-dirs %s', vimplugfile, vimplugurl))
	vim.g.plug_config_bootstrp = true
end
